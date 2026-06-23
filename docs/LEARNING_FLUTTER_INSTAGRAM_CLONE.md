# Flutter Instagram Clone 학습 플랜

대상: Flutter 입문자, Android 개발 경험은 있으나 Flutter/Dart는 직접 작성하며 익히는 학습자

목표: Flutter 공식 문서를 기준으로 Dart, 위젯, 레이아웃, 상태, 네트워크, 간단한 앱 구조를 익히고, Stitch UI 자료를 참고해 인스타그램 일부 화면을 Flutter로 구현한다.

방식: 공식 문서 기반 개념 학습, 질문 확인, 힌트형 퀴즈, 엄격 채점, 학습자 주도 코드 실습, 복습 문서 작성, 복습 문서 감사

복습 문서 prefix: `LEARNING_REVIEW_FLUTTER_INSTAGRAM_CLONE`

## 프로젝트 기준

- 앱 이름: Fluttergram
- 현재 앱 상태: `HomePage` 기반 첫 홈 화면 뼈대 작성 완료
- 테스트 코드 작성: 현재 학습 필수 범위에서 제외
- 검증 방식: 코드 포매팅, `flutter analyze`, 앱 실행 화면 확인 중심
- UI 목표 1: Stitch `_2` 홈 피드 화면
- UI 목표 2: Stitch `_1` Explore 그리드 화면
- API 목표: CATAAS 랜덤 고양이 이미지 API를 사용해 피드 이미지에 고양이 사진 표시

## 참조 자료

### 공식 학습 출처

- Dart language: https://dart.dev/language
- Flutter learning pathway: https://docs.flutter.dev/learn/pathway
- Building user interfaces with Flutter: https://docs.flutter.dev/ui
- Layouts in Flutter: https://docs.flutter.dev/ui/layout
- Display images from the internet: https://docs.flutter.dev/cookbook/images/network-image
- Fetch data from the internet: https://docs.flutter.dev/cookbook/networking/fetch-data
- Work with tabs: https://docs.flutter.dev/cookbook/design/tabs
- Simple app state management: https://docs.flutter.dev/data-and-backend/state-mgmt/simple
- Guide to app architecture: https://docs.flutter.dev/app-architecture/guide

### 프로젝트/실습 출처

- Stitch UI zip: `/Users/sangyoon/Downloads/stitch_instagram_ui_clone.zip`
- Stitch design tokens: `stitch_instagram_ui_clone/lumina_mobile/DESIGN.md`
- 홈 피드 화면: `stitch_instagram_ui_clone/_2/screen.png`, `stitch_instagram_ui_clone/_2/code.html`
- Explore 화면: `stitch_instagram_ui_clone/_1/screen.png`, `stitch_instagram_ui_clone/_1/code.html`
- CATAAS 공식 API: https://cataas.com/
- 사용자가 지정한 API 참고 글: https://velog.io/@yeonsubaek/React-openAPI%EB%A5%BC-%ED%99%9C%EC%9A%A9%ED%95%B4-%EB%9E%9C%EB%8D%A4%EC%9C%BC%EB%A1%9C-%EA%B3%A0%EC%96%91%EC%9D%B4-%EC%82%AC%EC%A7%84-%EB%B6%88%EB%9F%AC%EC%98%A4%EA%B8%B0

## 구현 대상 요약

### 홈 피드

- 상단 앱바: 좌측 카메라 아이콘, 중앙 Instagram/Fluttergram 제목, 우측 전송 아이콘
- 포스트 헤더: 32px 원형 아바타, username, 더보기 아이콘
- 미디어 영역: full-bleed 이미지, 1:1 또는 4:5 비율
- 액션 영역: 좋아요, 댓글, 공유, 북마크 아이콘
- 본문 영역: 좋아요 수, username + caption, 댓글 보기, 시간
- 하단 네비게이션: 56px 높이, 홈/검색 중심으로 시작

### Explore

- 상단 검색 바: 회색 배경, 검색 아이콘, location 아이콘
- 그리드: 3열, 1px 또는 2px gutter
- 미디어: 정사각형 이미지, 일부 항목에 영상/컬렉션 아이콘 오버레이
- 하단 네비게이션: 검색 탭 활성

### 디자인 토큰

- 배경: `#ffffff` 또는 `#f9f9f9`
- 기본 텍스트/아이콘: `#000000`
- 보조 텍스트: `#8E8E8E`
- divider: `#DBDBDB`
- 기본 마진: 12px
- spacing: 4px 단위
- avatar: 32px, story avatar: 64px
- bottom navigation height: 56px
- media corner radius: 0px
- button/input corner radius: 4px 또는 검색 바 10px

## API 설계 기준

- 기본 API 도메인: `https://cataas.com`
- 랜덤 이미지 직접 표시: `https://cataas.com/cat`
- JSON 기반 이미지 URL 얻기: `https://cataas.com/cat?json=true`
- JSON 방식은 응답의 `url` 값을 받아 `https://cataas.com/{url}` 형태의 이미지 URL로 만든다.
- Flutter 네트워크 요청 단계에서는 `http` package를 사용한다.
- Android에서 인터넷 요청을 하려면 `android/app/src/main/AndroidManifest.xml`에 `android.permission.INTERNET` 권한이 필요하다.

## 학습 규칙

- 각 단계는 공식 문서를 먼저 확인하고 설명한다.
- 설명 전에 학습 출처를 말한다.
- 흐름은 `사전 확인 -> 공식 출처 -> 짧은 설명 -> 질문 확인 -> 힌트형 퀴즈 -> 엄격 채점 -> 복습 문서 -> 실습 과제 -> 사용자 구현 -> 검증`이다.
- 퀴즈 전에 궁금한 점이 있는지 묻는다.
- 질문이 있으면 호기심 기록에 남긴다.
- 퀴즈는 엄격하게 채점한다. 핵심 개념이 빠지면 재시도를 요청한다.
- 사용자가 막히면 `힌트 1 -> 힌트 2 -> 부분 설명 -> 정답` 순서로 돕는다.
- 영어 축약어는 원어, 한글 의미, 실제 쓰임을 함께 적는다.
- 앱 코드, 테스트 코드, 빌드 파일 수정은 사용자가 직접 작성하는 것을 기본으로 한다.
- 테스트 코드는 현재 학습 필수 범위에 넣지 않는다. 사용자가 나중에 원하면 별도 선택 단계로 추가한다.
- 에이전트는 사용자가 "적용해줘", "직접 수정해줘", "구현해줘"라고 명시하지 않으면 앱 파일을 직접 수정하지 않는다.
- 실습 있는 단계는 실습 검증 통과 후에만 `완료`가 될 수 있다.
- 첫 미완료 단계는 상태가 `완료`가 아닌 가장 앞 단계다.

## 상태값

- `미시작`: 아직 설명 전
- `개념 진행 중`: 설명, 질문 확인, 퀴즈 전 단계
- `퀴즈 통과`: 개념 퀴즈는 통과했지만 복습 문서나 실습 처리가 남은 상태
- `실습 대기`: 실습 과제를 제시했고 사용자 구현을 기다리는 상태
- `실습 검증 중`: 사용자 구현을 검사하거나 재검증하는 상태
- `완료`: 복습 문서와 실습 검증이 끝난 상태

## 진행 기록

| 단계 | 주제 | 상태 | 퀴즈 결과 | 실습 상태 | 메모 |
|---|---|---|---|---|---|
| 0 | 학습 트랙 재정의와 요구사항 정리 | 완료 | - | - | 공식 문서, Stitch UI, CATAAS API 기준으로 플랜 재작성 |
| 1 | Dart/Flutter 앱 진입점과 기본 위젯 | 완료 | 통과 | Fluttergram 홈 뼈대 작성 | `runApp()`의 루트 위젯 전달 역할을 재시도 후 정확히 설명함 |
| 2 | 코드 포매팅과 현재 화면 점검 | 미시작 | - | - | formatter와 `flutter analyze`, 앱 실행 화면 확인 |
| 3 | 홈 피드 정적 UI 구성 | 미시작 | - | - | Stitch `_2` 기준 포스트 헤더, 이미지, 액션, 캡션 |
| 4 | Dart 모델과 더미 피드 데이터 | 미시작 | - | - | `Post`, `User`, 리스트 렌더링 |
| 5 | 리스트와 스크롤 | 미시작 | - | - | `ListView`, `SingleChildScrollView`, full-bleed media |
| 6 | 상태 관리 기초 | 미시작 | - | - | 좋아요/북마크 토글, `setState` |
| 7 | CATAAS 랜덤 이미지 API 연결 | 미시작 | - | - | `http`, `Future`, JSON, `Image.network`, Android internet permission |
| 8 | 로딩/에러/재시도 UI | 미시작 | - | - | `FutureBuilder` 또는 명시적 상태 |
| 9 | Explore 그리드 화면 | 미시작 | - | - | Stitch `_1` 기준 검색 바, 3열 grid, overlay icon |
| 10 | 하단 네비게이션과 화면 전환 | 미시작 | - | - | 홈/검색 탭 전환 |
| 11 | 파일 구조와 앱 아키텍처 기초 | 미시작 | - | - | widgets/models/services/pages 분리 |
| 12 | 최종 리팩터링과 수동 검증 | 미시작 | - | - | 파일 구조 정리, analyze 통과, 앱 실행 화면 확인 |

## 호기심 기록

| 단계 | 질문 내용 | 호기심 유형 | 다음 설명 반영점 |
|---|---|---|---|
| 1 | Flutter는 왜 2칸 들여쓰기를 쓰는가 | 설계 이유 | Dart formatter와 Flutter 위젯 트리 중첩을 함께 설명 |
| - | - | - | - |

## 간격 복습 기록

| 단계 | 복습 기준일 | 1차 복습 | 2차 복습 | 3차 복습 | 다시 헷갈린 개념 |
|---|---|---|---|---|---|
| 1 | 2026-06-19 | 당일 | 3일 후 | 7일 후 | `StatelessWidget` vs `StatefulWidget`, `Scaffold` 역할 |

## 실습 검증 기록

| 실습 | 상태 | 검사 항목 | 수정 필요 내용 | 재검증 결과 |
|---|---|---|---|---|
| Fluttergram 홈 화면 뼈대 | 통과 | 퀴즈 통과, 복습 문서 작성, 앱 코드 작성 완료 | 테스트 코드는 학습 필수 범위에서 제외 | 통과 |

## 단계별 학습 계획

### 1단계. Dart/Flutter 앱 진입점과 기본 위젯

학습 출처:

- https://dart.dev/language
- https://docs.flutter.dev/ui

배울 것:

- `main()`
- `runApp`
- `MaterialApp`
- `Scaffold`
- `StatelessWidget`
- widget tree

실습:

- 카운터 앱을 Fluttergram 첫 화면 뼈대로 바꾼다.
- 앱바, 본문, 하단 네비게이션을 만든다.

완료 체크:

- [x] `main()`과 `runApp()`의 역할을 설명한다.
- [x] `StatelessWidget`과 `StatefulWidget`의 차이를 설명한다.
- [x] 복습 문서를 만들고 검증한다.
- [x] 테스트 코드는 현재 학습 필수 범위에서 제외한다고 기록했다.

### 2단계. 코드 포매팅과 현재 화면 점검

학습 출처:

- https://docs.flutter.dev/tools/formatting

배울 것:

- Dart formatter
- `flutter analyze`
- IDE reformat
- 들여쓰기와 trailing comma
- 현재 화면 수동 확인

실습:

- 현재 `lib/main.dart`를 formatter 기준으로 정리한다.
- 앱을 실행해 Fluttergram 제목, 본문 텍스트, 하단 네비게이션이 보이는지 확인한다.

완료 체크:

- [ ] `dart format` 또는 IDE reformat을 적용한다.
- [ ] `flutter analyze`가 통과한다.
- [ ] 실행 화면에서 Fluttergram 홈 뼈대가 확인된다.

### 3단계. 홈 피드 정적 UI 구성

학습 출처:

- https://docs.flutter.dev/ui/layout
- https://docs.flutter.dev/ui/widgets

배울 것:

- `Row`
- `Column`
- `Padding`
- `SizedBox`
- `AspectRatio`
- `CircleAvatar`
- `IconButton`
- full-bleed media layout

실습:

- Stitch `_2` 화면을 기준으로 정적 포스트 카드 1개를 만든다.
- 이미지 영역은 아직 고정 placeholder 또는 직접 URL을 사용한다.

완료 체크:

- [ ] 포스트 헤더, 이미지, 액션 row, caption 영역이 분리된다.
- [ ] 12px margin과 4px spacing 단위를 지킨다.
- [ ] media 영역은 1:1 또는 4:5 비율을 유지한다.

### 4단계. Dart 모델과 더미 피드 데이터

학습 출처:

- https://dart.dev/language
- https://docs.flutter.dev/ui

배울 것:

- class
- constructor
- `final`
- `List`
- named parameter
- immutable data

실습:

- `Post` 모델을 만든다.
- 더미 게시글 리스트를 만든다.
- 리스트를 기반으로 여러 포스트를 렌더링한다.

완료 체크:

- [ ] UI에 직접 박힌 문자열을 모델 데이터로 옮긴다.
- [ ] `const`, `final` 사용 기준을 설명한다.

### 5단계. 리스트와 스크롤

학습 출처:

- https://docs.flutter.dev/ui/layout
- https://docs.flutter.dev/cookbook/lists/basic-list
- https://docs.flutter.dev/cookbook/lists/horizontal-list
- https://docs.flutter.dev/cookbook/lists/grid-lists

배울 것:

- `ListView`
- `ListView.builder`
- horizontal list
- `GridView`
- scroll constraint

실습:

- 홈 피드는 세로 스크롤 리스트로 만든다.
- story 영역은 가로 리스트로 만든다.

완료 체크:

- [ ] 세로 스크롤과 가로 스크롤의 제약 차이를 설명한다.
- [ ] overflow 없이 화면이 렌더링된다.

### 6단계. 상태 관리 기초

학습 출처:

- https://docs.flutter.dev/ui/interactivity
- https://docs.flutter.dev/data-and-backend/state-mgmt/simple

배울 것:

- ephemeral state
- `StatefulWidget`
- `State`
- `setState`
- event handler

실습:

- 좋아요 토글을 구현한다.
- 북마크 토글을 구현한다.
- 좋아요 수를 화면에 반영한다.

완료 체크:

- [ ] 왜 이번 단계부터 `StatefulWidget`이 필요한지 설명한다.
- [ ] `setState` 호출 위치와 이유를 설명한다.

### 7단계. CATAAS 랜덤 이미지 API 연결

학습 출처:

- https://docs.flutter.dev/cookbook/networking/fetch-data
- https://docs.flutter.dev/cookbook/images/network-image
- https://cataas.com/

배울 것:

- `http` package
- `Future`
- `async` / `await`
- JSON parsing
- `Image.network`
- Android internet permission

실습:

- CATAAS `/cat?json=true`를 호출한다.
- 응답의 `url`로 이미지 URL을 만든다.
- 피드 이미지에 랜덤 고양이 사진을 표시한다.

완료 체크:

- [ ] 네트워크 요청, JSON 변환, UI 표시 흐름을 설명한다.
- [ ] 로딩 중/성공/실패 상태를 구분한다.

### 8단계. 로딩/에러/재시도 UI

학습 출처:

- https://docs.flutter.dev/cookbook/networking/fetch-data
- https://docs.flutter.dev/ui

배울 것:

- loading state
- error state
- retry action
- `FutureBuilder`와 명시적 상태의 차이

실습:

- 이미지 로딩 indicator를 표시한다.
- 실패 시 재시도 버튼을 보여준다.

완료 체크:

- [ ] 네트워크 실패가 앱 전체 크래시로 이어지지 않는다.
- [ ] 사용자가 재시도할 수 있다.

### 9단계. Explore 그리드 화면

학습 출처:

- https://docs.flutter.dev/cookbook/lists/grid-lists
- https://docs.flutter.dev/ui/layout

배울 것:

- `GridView`
- `SliverGridDelegate`
- square tile
- overlay icon
- search bar UI

실습:

- Stitch `_1` Explore 화면을 정적 grid로 만든다.
- 일부 타일에 영상/컬렉션 아이콘 overlay를 추가한다.

완료 체크:

- [ ] 3열 grid와 1px/2px gutter를 구현한다.
- [ ] 검색 바와 하단 네비게이션이 화면 기준에 맞는다.

### 10단계. 하단 네비게이션과 화면 전환

학습 출처:

- https://docs.flutter.dev/cookbook/design/tabs
- https://docs.flutter.dev/ui/navigation

배울 것:

- selected index
- tab content switching
- navigation state

실습:

- 하단 네비게이션으로 홈/Explore 화면을 전환한다.

완료 체크:

- [ ] 현재 선택된 탭이 UI에 반영된다.
- [ ] 탭 전환 시 화면이 깨지지 않는다.

### 11단계. 파일 구조와 앱 아키텍처 기초

학습 출처:

- https://docs.flutter.dev/app-architecture/guide

배울 것:

- UI layer
- model
- service
- repository
- view/widget 분리

실습:

- `models`, `services`, `widgets`, `pages` 단위로 파일을 분리한다.
- CATAAS 호출 코드를 UI에서 분리한다.

완료 체크:

- [ ] UI 코드가 직접 API URL 조립과 JSON parsing을 모두 책임지지 않는다.
- [ ] 파일 구조를 설명할 수 있다.

### 12단계. 최종 리팩터링과 수동 검증

학습 출처:

- https://docs.flutter.dev/app-architecture/guide

배울 것:

- 파일 구조 정리
- 중복 제거
- 수동 검증 체크리스트
- `flutter analyze`

실습:

- 홈 피드와 Explore 화면 파일을 정리한다.
- 공통 위젯을 분리한다.
- 수동 검증 체크리스트를 만든다.

완료 체크:

- [ ] `flutter analyze` 통과
- [ ] 완성 화면이 Stitch 목표와 주요 구조가 일치

## 퀴즈 규칙

- 퀴즈는 설명 뒤 질문 확인 후에만 낸다.
- 정답에는 공식 용어가 들어가야 한다.
- 핵심 개념이 빠지면 오답이다.
- 답이 맞더라도 이유가 빠지면 보충 질문을 한다.
- 힌트 순서는 `힌트 1 -> 힌트 2 -> 부분 설명 -> 정답`이다.
- 정답은 사용자가 두 번 이상 시도했거나 명시적으로 요청했을 때만 제시한다.

## 실습 규칙

- 실습은 한 번에 작은 범위만 제시한다.
- 실습 과제에는 대상 파일, 허용 수정 범위, 통과 기준, 검증 명령을 포함한다.
- 사용자가 직접 구현한다.
- 에이전트는 검사와 피드백을 맡는다.
- 수정 필요 시 전체 정답 코드보다 원인, 기준, 수정 방향을 먼저 말한다.

## 복습 문서 생성 규칙

- 파일 이름은 `LEARNING_REVIEW_FLUTTER_INSTAGRAM_CLONE_STEP_{단계번호}.md` 형식을 사용한다.
- 각 복습 문서는 단계 퀴즈 통과 후 만든다.
- 복습 문서에는 아래 항목을 포함한다.
  - 단계 제목
  - 학습 출처
  - 핵심 요약
  - 사용자 질문 기반 정리
  - 헷갈리기 쉬운 구분
  - 한 줄 복습
  - 다시 물어볼 질문 1개에서 3개
  - 영어 축약어가 있으면 원어, 한글 의미, 실제 쓰임

## 복습 문서 감사 규칙

`learning-review-auditor` 기준으로 아래를 점검한다.

- 복습 문서의 출처가 공식 문서 또는 1차 출처인지 확인한다.
- 기술 설명이 출처와 맞는지 확인한다.
- 중복 설명을 줄인다.
- 사용자 질문 기반 정리가 실제 질문 의도를 보존하는지 확인한다.
- 다시 물어볼 질문이 단계 핵심을 재확인하게 만드는지 확인한다.
- 모호한 표현이 있으면 조건을 명시한다.

## 다음 세션 시작점

첫 미완료 단계는 1단계다.
다음 세션에서는 현재 `lib/main.dart`를 formatter 기준으로 정리하고, `flutter analyze`와 앱 실행 화면 확인으로 2단계를 진행한다.
