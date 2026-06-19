# Flutter Study Progress Log

## 진행 상태 요약

- 현재 단계: 0단계. 프로젝트 기준선 잡기
- 현재 앱 상태: Fluttergram 첫 홈 화면 뼈대 작성
- 다음 추천 세션: 작성한 `HomePage` 구조 복습, 포매팅 정리, 위젯 테스트를 새 화면 기준으로 수정하기
- 마지막 문서 업데이트: 2026-06-19

## 세션 기록

### 2026-06-19. 첫 Fluttergram 홈 화면 작성

작업:
- 기본 카운터 앱의 `MyHomePage`/`State` 구조를 제거하고 `HomePage` `StatelessWidget`을 작성했다.
- `MaterialApp`의 앱 이름을 `Fluttergram`으로 바꾸고 디버그 배너를 숨겼다.
- `Scaffold`를 사용해 상단 앱바, 본문 텍스트, 하단 네비게이션 바를 구성했다.

배운 내용:
- `main()`은 Dart/Flutter 앱의 시작점이다.
- `runApp()`은 Flutter에게 첫 위젯을 전달한다.
- 화면에 바뀌는 값이 없으면 `StatefulWidget` 대신 `StatelessWidget`을 쓸 수 있다.
- `Scaffold`는 `appBar`, `body`, `bottomNavigationBar` 같은 화면 기본 영역을 제공한다.

다음 작업:
- Dart formatter로 코드 스타일을 정리하는 법을 익힌다.
- 기존 카운터 위젯 테스트를 Fluttergram 홈 화면 기준 테스트로 바꾼다.
- 본문 `Text`를 실제 피드 카드 형태로 발전시킨다.

### 2026-06-19. 학습 진행 방식 수정

작업:
- 학습 세션에서 에이전트가 앱 코드를 직접 수정하지 않도록 `session_protocol.md`에 규칙을 추가했다.
- 기본 진행 방식을 "에이전트가 설명과 따라 칠 코드를 제공하고, 사용자가 직접 입력한다"로 명확히 했다.

배운 내용:
- 이 프로젝트의 목적은 완성된 코드를 빠르게 얻는 것이 아니라 Flutter를 직접 작성하며 배우는 것이다.
- 에이전트는 사용자가 명시적으로 요청하지 않는 한 앱 소스 파일을 패치하지 않는다.

다음 작업:
- 기본 카운터 앱 구조를 함께 읽는다.
- 사용자가 직접 따라 칠 수 있도록 첫 피드 화면 코드를 단계별로 제공한다.
- 사용자가 입력한 뒤 오류가 생기면 그 오류를 기준으로 함께 수정한다.

### 2026-06-17. 학습 문서 체계 생성

작업:
- `docs` 폴더를 생성했다.
- 전체 학습 계획을 `study_plan.md`에 정리했다.
- 매 세션 운영 규칙을 `session_protocol.md`에 정리했다.
- 진행 로그와 개념 노트 문서를 만들었다.

배운 내용:
- 아직 앱 코드는 수정하지 않았다.
- 이 프로젝트는 앞으로 인스타그램 클론을 만들며 Flutter와 Dart를 학습하는 용도로 사용한다.

다음 작업:
- `lib/main.dart`의 기본 카운터 앱 구조를 읽는다.
- `StatelessWidget`, `StatefulWidget`, `setState`, `MaterialApp`, `Scaffold`의 역할을 배운다.
- 첫 번째 실습으로 홈 피드 화면의 정적 뼈대를 만든다.

확인할 명령:
- `flutter analyze`
- `flutter test`

커밋 메모:
- 문서만 추가하는 초기 학습 관리 커밋으로 정리한다.
