# Flutter Instagram Clone Study Plan

이 문서는 초기 학습 계획이다.
현재 활성 계획은 공식 문서와 Stitch UI/CATAAS API 요구사항을 반영한 `LEARNING_FLUTTER_INSTAGRAM_CLONE.md`다.
새 학습 세션은 `LEARNING.md`에서 활성 트랙을 확인한 뒤 진행한다.

목표는 인스타그램 클론을 만들면서 Dart 문법, Flutter 위젯, 레이아웃, 상태 관리, 라우팅, 비동기 처리, 로컬/원격 데이터 흐름, 테스트와 앱 구조를 단계적으로 익히는 것이다.

## 0단계. 프로젝트 기준선 잡기

목표:
- Flutter 프로젝트 구조를 이해한다.
- `lib/main.dart`, `pubspec.yaml`, `test/`의 역할을 안다.
- 문서 기반 학습 흐름을 만든다.

배울 내용:
- Flutter 앱 진입점 `main()`
- `runApp`
- `MaterialApp`
- `StatelessWidget`과 `StatefulWidget`의 차이
- Hot reload와 hot restart

실습:
- 기본 카운터 앱 읽기
- 앱 이름과 테마를 인스타그램 클론 방향으로 바꾸기
- 첫 화면을 단순 피드 화면으로 교체하기

완료 기준:
- 기본 카운터 앱 코드의 구조를 설명할 수 있다.
- 첫 번째 커밋에 학습 문서가 포함되어 있다.

## 1단계. Dart 기초와 Flutter 위젯 감각 익히기

목표:
- Dart 기본 문법을 Flutter 코드 안에서 익힌다.
- 위젯 트리와 빌드 메서드의 감각을 만든다.

배울 내용:
- 변수: `final`, `const`, `var`
- 타입: `String`, `int`, `bool`, `List`, `Map`
- 함수와 named parameter
- 클래스, 생성자, 필드
- nullable 타입과 null safety
- `Text`, `Icon`, `Image`, `Container`, `Padding`, `Column`, `Row`, `Stack`

실습:
- 인스타그램 피드 카드 정적 UI 만들기
- 더미 게시글 모델 만들기
- 리스트로 여러 게시글 렌더링하기

완료 기준:
- 더미 데이터 기반 피드 목록이 표시된다.
- `const`를 어디에 붙일 수 있는지 설명할 수 있다.

## 2단계. 레이아웃과 스크롤

목표:
- 모바일 화면을 구성하는 기본 레이아웃 패턴을 익힌다.
- 스크롤 가능한 피드와 스토리 영역을 만든다.

배울 내용:
- `Scaffold`
- `AppBar`
- `SafeArea`
- `ListView`
- `SingleChildScrollView`
- `Expanded`, `Flexible`
- `MediaQuery`
- `ClipRRect`, `CircleAvatar`

실습:
- 홈 피드 화면 만들기
- 상단 스토리 가로 리스트 만들기
- 게시글 이미지/좋아요/댓글 영역 구성하기

완료 기준:
- 화면 크기가 바뀌어도 깨지지 않는 피드 화면이 있다.
- 세로/가로 스크롤의 차이를 설명할 수 있다.

## 3단계. 상태 관리 기초

목표:
- 사용자 인터랙션에 따라 UI가 바뀌는 원리를 익힌다.
- 작은 범위에서는 `setState`를 정확히 사용한다.

배울 내용:
- `StatefulWidget`
- `State`
- `setState`
- 이벤트 핸들러
- 위젯 분리와 상태 위치

실습:
- 게시글 좋아요 토글
- 북마크 토글
- 댓글 수 증가 더미 동작

완료 기준:
- `setState`가 필요한 경우와 필요 없는 경우를 구분한다.
- 상태를 너무 위로 올리거나 아래에 가두는 문제를 설명할 수 있다.

## 4단계. 화면 분리와 라우팅

목표:
- 여러 화면을 가진 앱 구조를 만든다.
- 홈, 검색, 작성, 릴스, 프로필 탭을 구성한다.

배울 내용:
- `Navigator`
- route
- bottom navigation
- page widget 분리
- feature 폴더 구조

실습:
- 하단 탭 네비게이션 만들기
- 프로필 화면 만들기
- 게시글 상세 화면으로 이동하기

완료 기준:
- 최소 3개 이상의 화면을 자연스럽게 이동할 수 있다.
- 화면 파일과 위젯 파일을 기준 있게 나눈다.

## 5단계. 폼과 입력

목표:
- 사용자가 입력하는 데이터를 다루는 법을 배운다.
- 게시글 작성 화면의 기본 흐름을 만든다.

배울 내용:
- `TextField`
- `TextEditingController`
- form validation
- keyboard 대응
- `FocusNode`

실습:
- 게시글 작성 화면
- 캡션 입력
- 더미 게시글 추가

완료 기준:
- 입력값 검증 후 게시글 목록에 반영한다.
- controller를 dispose해야 하는 이유를 설명한다.

## 6단계. 비동기와 데이터 계층

목표:
- 실제 앱처럼 로딩, 성공, 실패 상태를 다룬다.
- 데이터 모델과 repository 패턴을 익힌다.

배울 내용:
- `Future`
- `async` / `await`
- loading/error/empty state
- model, repository, service 분리
- JSON 직렬화 기초

실습:
- 더미 API 지연 로딩 구현
- 피드 로딩 상태 표시
- 실패 상태와 재시도 버튼 구현

완료 기준:
- 비동기 데이터를 UI 상태로 표현할 수 있다.
- UI 코드와 데이터 코드를 분리한다.

## 7단계. 실전 상태 관리 도입

목표:
- 앱 규모가 커질 때 필요한 상태 관리 방식을 배운다.
- 우선 Provider 또는 Riverpod 중 하나를 선택해 적용한다.

배울 내용:
- 전역 상태와 지역 상태
- dependency injection 감각
- provider scope
- immutable state

실습:
- 피드 상태 관리 이전
- 좋아요/북마크 상태 관리 이전
- 프로필 상태 관리

완료 기준:
- `setState`만 사용할 때의 한계를 설명한다.
- 선택한 상태 관리 라이브러리의 기본 패턴으로 기능 하나를 완성한다.

## 8단계. 로컬 저장과 앱 유지성

목표:
- 앱을 껐다 켜도 유지되는 데이터를 다룬다.

배울 내용:
- shared preferences 또는 local database
- 캐시
- 앱 시작 시 초기화
- 설정값 저장

실습:
- 좋아요/북마크 로컬 저장
- 로그인한 사용자 더미 정보 저장

완료 기준:
- 앱 재시작 후에도 일부 상태가 유지된다.

## 9단계. 인증과 원격 백엔드 맛보기

목표:
- 클론 앱의 로그인 흐름을 만든다.
- Firebase 또는 mock backend 중 하나로 확장한다.

배울 내용:
- auth flow
- token/session 개념
- guarded route
- remote CRUD

실습:
- 로그인/회원가입 UI
- 더미 인증 또는 Firebase Auth 연결
- 내 게시글과 전체 피드 분리

완료 기준:
- 로그인 상태에 따라 진입 화면이 달라진다.

## 10단계. 품질 관리와 배포 준비

목표:
- 학습 프로젝트라도 유지 가능한 앱으로 다듬는다.

배울 내용:
- widget test
- unit test
- lint
- formatting
- build
- release 기본

실습:
- 주요 위젯 테스트 추가
- repository 테스트 추가
- Android debug/release 빌드 확인

완료 기준:
- `flutter analyze`와 테스트가 통과한다.
- 앱 구조를 스스로 설명할 수 있다.

## 세션 크기 원칙

한 번의 학습 세션은 아래 중 하나만 목표로 한다.

- 새 개념 1개 학습
- 작은 UI 컴포넌트 1개 구현
- 기존 코드 리팩터링 1개
- 테스트 1개 추가
- 문서 정리 1개

학습 속도보다 중요한 것은 매 세션마다 "무엇을 배웠고, 왜 이렇게 짰는지"를 남기는 것이다.
