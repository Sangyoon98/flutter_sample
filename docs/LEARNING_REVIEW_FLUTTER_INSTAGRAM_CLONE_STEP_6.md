# 6단계 복습: 상태 관리 기초

## 학습 출처

- Flutter interactivity: https://docs.flutter.dev/ui/interactivity
- Simple app state management: https://docs.flutter.dev/data-and-backend/state-mgmt/simple

## 핵심 요약

- `StatelessWidget`은 내부에 변경되는 상태를 직접 들고 있지 않은 위젯이다.
- `StatefulWidget`은 사용자 상호작용이나 데이터 변화로 화면이 바뀌어야 할 때 사용한다.
- `State` 객체는 실제로 변경되는 값을 보관한다.
- `setState()`는 상태 값을 바꾼 뒤 Flutter에게 해당 위젯을 다시 빌드해야 한다고 알려준다.
- 좋아요 여부처럼 위젯 하나 안에서만 필요한 값은 지역 상태로 관리할 수 있다.

## 사용자 질문 기반 정리

### StatelessWidget이 충분했던 이유

**질문:** 이전 단계까지 `PostCard`가 `StatelessWidget`이어도 괜찮았던 이유는 무엇인가?

**답:** 화면에 표시되는 값이 사용자 입력으로 바뀌지 않았기 때문이다. 정적인 게시글 데이터를 받아 화면에 보여주기만 하면 내부 변경 상태가 필요 없으므로 `StatelessWidget`으로 충분했다.

### StatefulWidget이 필요한 이유

**질문:** 좋아요 버튼을 누르면 왜 `StatefulWidget`이 필요한가?

**답:** 좋아요 여부와 좋아요 수가 사용자 입력에 따라 바뀌어야 하기 때문이다. `_isLiked` 같은 변경 가능한 값을 `State` 안에 저장하고, 버튼을 누를 때 값을 바꿔 화면에 반영해야 한다.

### setState 역할

**질문:** `setState()`는 어떤 역할을 하는가?

**답:** `setState()` 안에서 상태 값을 변경하면 Flutter가 해당 위젯을 다시 빌드한다. 이번 실습에서는 `_isLiked` 값을 반대로 바꾸고, 하트 아이콘과 좋아요 수가 새 상태에 맞게 다시 그려졌다.

## 헷갈리기 쉬운 구분

- `StatefulWidget` 자체가 상태 값을 직접 보관하는 것이 아니라 연결된 `State` 객체가 상태를 보관한다.
- `widget.post`는 `State` 안에서 `PostCard` 위젯이 받은 `post` 값을 꺼내는 표현이다.
- `_isLiked`는 현재 `PostCard` 하나 안에서만 필요한 지역 상태다.
- `setState()` 없이 값만 바꾸면 Flutter가 다시 빌드해야 한다는 사실을 알 수 없다.

## 한 줄 복습

좋아요처럼 사용자 입력으로 화면이 바뀌는 값은 `State`에 보관하고, `setState()`로 값을 바꾼 뒤 화면을 다시 빌드하게 한다.

## 다시 물어볼 질문

1. `StatelessWidget`과 `StatefulWidget`의 차이는 무엇인가?
2. `State` 객체는 어떤 값을 보관하는가?
3. `setState()`를 호출하지 않으면 어떤 문제가 생길 수 있는가?
