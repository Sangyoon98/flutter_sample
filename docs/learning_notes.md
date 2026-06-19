# Flutter Learning Notes

공부하면서 배운 개념을 누적하는 문서다.
각 항목은 처음에는 짧게 적고, 실제 코드로 경험한 뒤 보강한다.

## Flutter 기본 구조

- `main()`은 Dart 프로그램의 시작 함수다. Flutter 앱도 여기서 시작한다.
- `runApp()`은 Flutter 프레임워크에 화면의 루트 위젯을 전달한다.
- `MaterialApp`은 Material Design 기반 앱의 최상위 설정 위젯이다. 앱 제목, 테마, 첫 화면 등을 정한다.
- `Scaffold`는 한 화면의 기본 골격을 만든다. 대표 영역은 `appBar`, `body`, `bottomNavigationBar`다.
- `BuildContext`는 현재 위젯이 위젯 트리의 어디에 있는지 알려주는 문맥 객체다. 오늘은 직접 사용하지 않았지만 모든 `build` 메서드가 받는다.

## Widget

- `Widget`은 Flutter UI를 구성하는 기본 단위다.
- `StatelessWidget`은 자기 내부에 바뀌는 상태를 들고 있지 않은 위젯이다.
- `StatefulWidget`은 사용자 입력이나 데이터 변화에 따라 화면이 바뀌어야 할 때 사용한다.
- widget tree는 위젯이 부모-자식 관계로 중첩된 구조다.
- build method는 현재 상태와 설정을 바탕으로 화면에 그릴 위젯 트리를 반환한다.
- `const` widget

## Dart

작성 예정:
- `final`과 `const`
- named parameter
- class
- null safety
- collection

## Layout

작성 예정:
- `Row`
- `Column`
- `Stack`
- `Expanded`
- `Padding`
- `ListView`

## State

작성 예정:
- local state
- `setState`
- state lifting
- immutable data

## Project Decisions

현재 결정:
- 처음에는 기본 Flutter와 Dart만 사용한다.
- 상태 관리는 `setState`로 충분히 익힌 뒤 Provider 또는 Riverpod을 선택한다.
- 인스타그램 클론 기능은 홈 피드부터 시작한다.
