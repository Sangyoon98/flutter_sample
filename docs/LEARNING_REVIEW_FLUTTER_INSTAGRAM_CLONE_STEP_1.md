# 1단계 복습: Dart/Flutter 앱 진입점과 기본 위젯

## 학습 출처

- Dart language: https://dart.dev/language
- Flutter UI: https://docs.flutter.dev/ui

## 핵심 요약

- `main()`은 Dart 프로그램의 시작 함수다.
- `runApp()`은 전달받은 위젯을 Flutter 앱의 루트 위젯으로 붙여 렌더링을 시작한다.
- `MyApp`은 현재 앱에서 `MaterialApp`을 반환하는 루트 위젯 역할을 한다.
- `StatelessWidget`은 내부에 바뀌는 상태가 없는 위젯에 사용한다.
- `Scaffold`는 Material 화면의 기본 골격을 만들며 `appBar`, `body`, `bottomNavigationBar` 같은 영역을 제공한다.

## 사용자 질문 기반 정리

### 루트 위젯

**질문:** `runApp(const MyApp())`에서 `MyApp`은 어떤 역할로 전달되는가?

**답:** `MyApp`은 Flutter 앱의 루트 위젯으로 전달된다. Flutter는 이 루트 위젯에서 시작해 아래 자식 위젯들을 따라가며 화면에 그릴 위젯 트리를 만든다.

### StatelessWidget 선택 기준

**질문:** 지금 `HomePage`를 `StatefulWidget`이 아니라 `StatelessWidget`으로 만든 이유는 무엇인가?

**답:** 현재 `HomePage`는 내부에서 변하는 값을 갖고 있지 않다. 좋아요 수, 선택된 탭, 네트워크 로딩 상태처럼 화면을 다시 그려야 하는 상태가 생기기 전까지는 `StatelessWidget`으로 충분하다.

### Scaffold 영역

**질문:** `Scaffold`는 `appBar`, `body`, `bottomNavigationBar`와 어떻게 연결되는가?

**답:** `Scaffold`는 한 화면의 구조를 잡는 위젯이다. `appBar`에는 상단 앱바, `body`에는 중심 콘텐츠, `bottomNavigationBar`에는 하단 네비게이션을 배치한다.

## 헷갈리기 쉬운 구분

- `main()`은 Dart 시작 함수이고, `runApp()`은 Flutter 앱에 루트 위젯을 전달하는 함수다.
- `StatelessWidget`은 화면이 절대 바뀌지 않는다는 뜻이 아니라, 위젯 자신이 변경 가능한 상태를 들고 있지 않다는 뜻이다.
- `Scaffold`는 화면 전체 앱이 아니라 한 Material 화면의 기본 레이아웃 골격이다.

## 한 줄 복습

Flutter 앱은 `main()`에서 시작하고, `runApp()`이 루트 위젯을 받아 위젯 트리를 렌더링하며, `Scaffold`는 한 화면의 기본 영역을 구성한다.

## 다시 물어볼 질문

1. `main()`과 `runApp()`의 역할 차이는 무엇인가?
2. 어떤 상황이 되면 `HomePage`를 `StatefulWidget`으로 바꿔야 하는가?
3. `Scaffold`에서 `appBar`, `body`, `bottomNavigationBar`는 각각 어떤 영역인가?
