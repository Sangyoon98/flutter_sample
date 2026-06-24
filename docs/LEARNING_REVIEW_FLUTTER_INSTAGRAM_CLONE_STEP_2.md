# 2단계 복습: 코드 포매팅과 현재 화면 점검

## 학습 출처

- Flutter code formatting: https://docs.flutter.dev/tools/formatting

## 핵심 요약

- Dart formatter는 코드를 권장 스타일 기준으로 자동 정리한다.
- formatter를 쓰면 프로젝트 안의 코드 스타일이 일관된다.
- trailing comma는 마지막 인자 뒤에 붙는 쉼표다.
- trailing comma가 있으면 formatter가 여러 줄 구조를 유지하기 쉽다.
- `flutter analyze`는 코드의 정적 문제와 lint를 확인한다.

## 사용자 질문 기반 정리

### Formatter 사용 이유

**질문:** Dart formatter를 쓰면 팀이나 프로젝트에서 왜 좋은가?

**답:** formatter가 코드를 자동으로 정리해서 코드 스타일이 일관된다. 그래서 사람이 들여쓰기나 줄바꿈을 계속 맞추는 부담이 줄고, 코드를 읽을 때 구조를 더 빠르게 파악할 수 있다.

### Trailing Comma

**질문:** trailing comma를 붙이면 formatter 결과가 어떻게 달라질 수 있는가?

**답:** 마지막 인자 뒤에 trailing comma를 붙이면 formatter가 위젯 생성자나 함수 호출을 여러 줄 형태로 정리하기 쉽다. Flutter 위젯 트리가 깊어질 때 구조를 눈으로 따라가기 좋아진다.

## 헷갈리기 쉬운 구분

- formatter는 코드 동작을 바꾸는 도구가 아니라 코드 모양을 정리하는 도구다.
- `flutter analyze`는 앱을 실행하는 명령이 아니라 정적 분석 명령이다.
- trailing comma는 필수 문법이 아니지만 Flutter 코드 가독성을 위해 자주 사용한다.

## 한 줄 복습

Dart formatter는 코드 스타일을 일관되게 만들고, trailing comma는 Flutter 위젯 트리를 여러 줄로 읽기 쉽게 유지하는 데 도움을 준다.

## 다시 물어볼 질문

1. formatter를 사용하면 프로젝트에서 어떤 이점이 있는가?
2. trailing comma는 formatter 결과에 어떤 영향을 줄 수 있는가?
3. `flutter analyze`는 앱 실행과 어떻게 다른가?
