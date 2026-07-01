import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttergram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class Post {
  const Post({
    required this.userName,
    required this.avatarText,
    required this.likeCount,
    required this.caption,
    required this.imageUrl,
  });

  final String userName;
  final String avatarText;
  final int likeCount;
  final String caption;
  final String imageUrl;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Post> posts = [
      Post(
        userName: 'sangyoon',
        avatarText: 'S',
        likeCount: 128,
        caption: 'Flutter로 인스타그램 피드 UI를 만드는 중',
        imageUrl: 'https://cataas.com/cat',
      ),
      Post(
        userName: 'flutter dev',
        avatarText: 'F',
        likeCount: 256,
        caption: 'ListView로 여러 게시글을 스크롤하는 중',
        imageUrl: 'https://cataas.com/cat',
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fluttergram'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
        ],
      ),
      body: ListView(
        children: [
          PostCard(post: posts[0]),
          const Divider(height: 1),
          PostCard(post: posts[1]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_display_outlined),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.post});

  final Post post;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isLiked = false;
  late Future<String> _catImageUrlFuture;

  @override
  void initState() {
    super.initState();
    _catImageUrlFuture = fetchCatImageUrl();
  }

  Future<String> fetchCatImageUrl() async {
    final response = await http.get(
      Uri.parse('https://cataas.com/cat?json=true'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load cat image');
    }

    final Map<String, dynamic> data = jsonDecode(response.body);
    final String imageUrl = data['url'];

    if (imageUrl.startsWith('http')) {
      return imageUrl;
    }

    return 'https://cataas.com$imageUrl';
  }

  Widget _buildCatImageError() {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 32),
            const SizedBox(height: 8),
            const Text('이미지를 불러오지 못했어요'),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _catImageUrlFuture = fetchCatImageUrl();
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('다시 시도'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    final likeCount = post.likeCount + (_isLiked ? 1 : 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              CircleAvatar(radius: 16, child: Text(post.avatarText)),
              const SizedBox(width: 8),
              Text(
                post.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: FutureBuilder<String>(
            future: _catImageUrlFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError || !snapshot.hasData) {
                return _buildCatImageError();
              }

              return Image.network(
                snapshot.data!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildCatImageError();
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                  });
                },
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : null,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mode_comment_outlined),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bookmark_border),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$likeCount likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(12, 6, 12, 0),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${post.userName} ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post.caption),
              ],
            ),
          ),
        ),
      ],
    );
  }
}