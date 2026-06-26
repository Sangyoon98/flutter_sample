# 4단계 복습: Dart 모델과 더미 피드 데이터

## 학습 출처

- Dart classes: https://dart.dev/language/classes
- Dart variables: https://dart.dev/language/variables

## 핵심 요약

- `class`는 관련 있는 데이터와 동작을 하나의 타입으로 묶는다.
- `Post` 모델은 게시글의 `userName`, `avatarText`, `likeCount`, `caption`을 함께 표현한다.
- `final`은 한 번 할당한 뒤 다시 바꿀 수 없는 변수를 뜻한다.
- `required`는 named parameter를 생성자 호출 시 반드시 넘기도록 강제한다.
- 모델 필드 값을 위젯에 넣으면 해당 위젯은 런타임 값을 사용하므로 보통 `const`를 붙일 수 없다.

## 사용자 질문 기반 정리

### 모델을 만드는 이유

**질문:** UI에 직접 들어간 값을 왜 `Post` 모델로 옮기는가?

**답:** `sangyoon`, `128`, `caption` 같은 값을 UI에 직접 박아두면 게시글이 늘어날 때 위젯 코드를 계속 고쳐야 한다. `Post` 모델로 묶으면 UI는 `post.userName`, `post.likeCount`, `post.caption`처럼 데이터만 받아 표시할 수 있다.

### Final 의미

**질문:** `final String userName;`에서 `final`은 무슨 뜻인가?

**답:** `final`은 한 번 값을 할당하면 같은 객체 안에서 다시 바꿀 수 없다는 뜻이다. `Post` 객체가 만들어질 때 `userName`이 정해지고, 그 뒤에는 해당 필드를 재할당할 수 없다.

### Required 의미

**질문:** `required this.userName`에서 `required`는 무슨 뜻인가?

**답:** `required`는 생성자를 호출할 때 해당 named parameter를 반드시 넘기도록 강제한다. 그래서 `Post(userName: ...)`처럼 필요한 값을 빠뜨리면 분석 단계에서 오류가 난다.

### Const와 모델 값

**질문:** 모델 필드 값을 쓰는 위젯에서는 왜 `const`를 제거하는가?

**답:** `const Text('sangyoon')`처럼 코드에 직접 적힌 고정 문자열은 컴파일 타임에 값이 확정된다. 반면 `Text(post.userName)`은 객체 필드에서 값을 꺼내므로 실행 중 값으로 취급된다. 그래서 위젯 자체에는 `const`를 붙이지 않고, 고정 설정인 `TextStyle` 같은 내부 값에만 `const`를 붙일 수 있다.

## 헷갈리기 쉬운 구분

- `final`은 재할당 금지이고, `const`는 컴파일 타임 상수다.
- `required`는 값이 중요하다는 설명이 아니라 생성자 호출 시 빠뜨릴 수 없도록 하는 문법이다.
- `post.userName`은 모델 객체의 필드 접근이다.
- `'${post.likeCount} likes'`는 문자열 안에 값을 끼워 넣는 string interpolation이다.

## 한 줄 복습

`Post` 모델은 게시글 데이터를 UI 밖으로 분리하고, `final`은 재할당을 막으며, `required`는 생성자 호출 시 필수 값을 강제한다.

## 다시 물어볼 질문

1. `Post` 모델을 만들면 UI 코드가 어떤 점에서 좋아지는가?
2. `final`과 `const`의 차이는 무엇인가?
3. `required`가 빠진 named parameter는 호출할 때 어떤 차이가 생기는가?
