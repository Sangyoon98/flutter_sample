# Flutter Study Progress Log

## 진행 상태 요약

- 현재 단계: `LEARNING_FLUTTER_INSTAGRAM_CLONE.md` 활성 트랙 기준
- 현재 앱 상태: Fluttergram 홈 피드가 CATAAS 랜덤 고양이 이미지와 로딩/에러/재시도 UI를 표시
- 다음 추천 세션: Stitch `_1` 기준 Explore 검색 바와 3열 그리드 UI 작성
- 마지막 문서 업데이트: 2026-07-01

## 세션 기록

### 2026-07-01. 로딩/에러/재시도 UI 추가

작업:
- API 응답의 `statusCode`를 확인하고 실패 시 예외를 던지도록 했다.
- `FutureBuilder`에서 로딩, API 실패, 데이터 없음 상태를 구분했다.
- 이미지 파일 로딩 실패를 `Image.network(errorBuilder)`로 처리했다.
- 에러 UI에 재시도 버튼을 추가했다.
- 재시도 시 새 `Future`를 만들어 다시 요청하도록 했다.

배운 내용:
- `snapshot.hasData == false`가 항상 로딩을 의미하지는 않는다.
- API 요청 실패와 이미지 로딩 실패는 발생 위치가 다르므로 처리 위치도 다르다.
- 이미 완료된 `Future`를 재사용하면 재시도가 되지 않으므로 새 `Future`를 만들어야 한다.

다음 작업:
- Explore 화면의 정적 구조를 만든다.
- 검색 바와 3열 이미지 그리드를 구현한다.

### 2026-06-29. CATAAS 랜덤 이미지 API 연결

작업:
- `http` 패키지를 추가해 CATAAS JSON API를 호출했다.
- Android `INTERNET` 권한을 추가했다.
- JSON 응답에서 이미지 URL을 꺼내 `Image.network()`로 피드 이미지를 표시했다.
- `FutureBuilder`로 로딩 중 화면과 성공 화면을 나눴다.
- `Future`를 `initState()`에서 한 번 생성해 rebuild마다 랜덤 이미지가 다시 바뀌는 문제를 해결했다.

배운 내용:
- 네트워크 요청은 UI를 멈추지 않도록 비동기로 처리한다.
- API 응답의 URL이 전체 URL인지 상대 경로인지 확인해야 한다.
- `FutureBuilder`의 `future`를 `build()`에서 매번 새로 만들면 API가 반복 호출될 수 있다.

다음 작업:
- 네트워크 실패 상태를 처리한다.
- 실패 시 재시도 버튼을 표시한다.
- 이미지 로딩/성공/실패 흐름을 더 명확하게 분리한다.

### 2026-06-22. 공식 문서 기반 학습 트랙 재정의

작업:
- `LEARNING.md` 색인 문서를 추가했다.
- `LEARNING_FLUTTER_INSTAGRAM_CLONE.md` 활성 학습 트랙을 만들었다.
- `clone_target.md`에 Stitch UI와 CATAAS API 기준 구현 목표를 정리했다.
- `session_protocol.md`가 새 활성 트랙 문서를 우선 보도록 수정했다.

배운 내용:
- 앞으로 진행 상태, 퀴즈, 호기심 기록, 복습, 실습 검증은 활성 학습 트랙 문서에서 관리한다.
- 홈 피드 화면은 Stitch `_2`, Explore 화면은 Stitch `_1`을 기준으로 구현한다.
- 랜덤 피드 이미지는 CATAAS API를 사용한다.

다음 작업:
- 1단계 핵심 개념을 짧게 복습하고 퀴즈를 진행한다.
- 2단계에서 현재 카운터 기준 위젯 테스트를 Fluttergram 홈 화면 기준으로 수정한다.

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
