# 5단계 복습: 리스트와 스크롤

## 학습 출처

- Basic lists: https://docs.flutter.dev/cookbook/lists/basic-list
- Horizontal lists: https://docs.flutter.dev/cookbook/lists/horizontal-list
- Grid lists: https://docs.flutter.dev/cookbook/lists/grid-lists
- Flutter layout: https://docs.flutter.dev/ui/layout

## 핵심 요약

- `List<Post>`는 `Post` 객체 여러 개를 담는 목록 데이터다.
- `ListView`는 스크롤 가능한 세로 목록을 만든다.
- `Column`은 자식을 세로로 배치하지만 기본적으로 스크롤을 제공하지 않는다.
- 인스타그램 피드는 게시글이 화면보다 길어질 수 있으므로 `Column`보다 `ListView`가 맞다.
- `PostCard`처럼 게시글 하나를 그리는 위젯을 분리하면 같은 UI를 다른 데이터로 재사용할 수 있다.

## 사용자 질문 기반 정리

### 목록 데이터

**질문:** 게시글이 여러 개일 때 왜 `Post` 하나가 아니라 `List<Post>`를 쓰는가?

**답:** 게시글 여러 개를 하나의 목록 데이터로 다루기 위해서다. `List<Post>`를 사용하면 `posts[0]`, `posts[1]`처럼 여러 게시글 데이터를 순서대로 화면에 전달할 수 있다.

### Column과 ListView

**질문:** `Column`과 `ListView`의 가장 큰 차이는 무엇인가?

**답:** `Column`은 세로 배치만 하고 기본적으로 스크롤되지 않는다. `ListView`는 스크롤 가능한 세로 목록을 만든다. 게시글이 화면보다 길어지는 피드 화면에는 `ListView`가 적합하다.

### 스크롤이 안 보이는 이유

**질문:** `ListView`를 썼는데 왜 스크롤이 안 되는 것처럼 보일 수 있는가?

**답:** `ListView`는 스크롤 가능한 위젯이지만, 실제로 움직임이 보이려면 자식들의 전체 높이가 화면에서 사용할 수 있는 높이보다 커야 한다. 내용이 화면 안에 거의 들어오면 스크롤할 여분이 적어서 안 움직이는 것처럼 느낄 수 있다.

### Builder를 나중에 쓰는 이유

**질문:** 왜 바로 `ListView.builder`를 쓰지 않고 `ListView(children: [...])`부터 쓰는가?

**답:** 먼저 목록 데이터와 스크롤 구조를 직접 이해하기 위해서다. `ListView.builder`는 항목이 많을 때 필요한 만큼만 위젯을 만드는 방식이고, 이후 단계에서 배운다.

## 헷갈리기 쉬운 구분

- `List<Post>`는 데이터 목록이고, `ListView`는 화면에 스크롤 목록을 그리는 위젯이다.
- `PostCard`는 게시글 하나를 화면에 그리는 위젯이다.
- `ListView(children: [...])`는 직접 자식 위젯을 나열한다.
- `ListView.builder`는 많은 데이터를 효율적으로 렌더링할 때 쓴다.

## 한 줄 복습

피드처럼 여러 게시글이 세로로 이어지는 화면은 `List<Post>` 데이터를 `ListView`에 전달하고, 게시글 하나는 `PostCard`로 재사용한다.

## 다시 물어볼 질문

1. `List<Post>`와 `ListView`는 각각 무엇을 담당하는가?
2. `Column` 대신 `ListView`를 쓰는 이유는 무엇인가?
3. `ListView`인데도 스크롤 움직임이 안 보일 수 있는 조건은 무엇인가?
