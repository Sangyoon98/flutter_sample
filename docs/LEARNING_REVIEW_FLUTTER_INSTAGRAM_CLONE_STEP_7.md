# 7단계 복습: CATAAS 랜덤 이미지 API 연결

## 학습 출처

- Flutter fetch data from the internet: https://docs.flutter.dev/cookbook/networking/fetch-data
- Flutter display images from the internet: https://docs.flutter.dev/cookbook/images/network-image
- FutureBuilder API: https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
- CATAAS API: https://cataas.com/
- http package: https://pub.dev/packages/http

## 핵심 요약

- 외부 API 요청은 시간이 걸리므로 `Future`, `async`, `await`로 비동기 처리한다.
- `http.get()`은 URL로 요청을 보내고 응답을 돌려준다.
- JSON 응답은 `jsonDecode()`로 Dart에서 사용할 수 있는 `Map<String, dynamic>` 형태로 변환한다.
- `Image.network()`는 이미지 URL을 받아 네트워크 이미지를 화면에 표시한다.
- Android에서 인터넷 요청을 하려면 `AndroidManifest.xml`에 `android.permission.INTERNET` 권한이 필요하다.
- `FutureBuilder`는 `Future`의 상태에 따라 로딩 중 화면과 성공 화면을 나눠 그릴 수 있다.
- `FutureBuilder`에 넘기는 `future`는 `build()` 안에서 새로 만들지 않고 `initState()`에서 한 번 생성해 보관하는 것이 안전하다.

## 사용자 질문 기반 정리

### 비동기 처리가 필요한 이유

**질문:** API에서 이미지를 가져오는 작업은 왜 비동기 개념이 필요한가?

**답:** 네트워크 요청을 동기적으로 기다리면 이미지 응답이 올 때까지 UI가 멈출 수 있다. `Future`, `async`, `await`를 사용하면 요청 결과는 기다리면서도 Flutter UI는 계속 그릴 수 있다.

### 이미지 URL 직접 표시와 JSON API 호출의 차이

**질문:** `Image.network()`에 URL을 바로 넣는 방식과 `http.get()`으로 JSON을 먼저 받아오는 방식은 무엇이 다른가?

**답:** `Image.network('https://...')`는 이미 이미지 주소를 알고 있을 때 바로 표시하는 방식이다. `http.get()`으로 JSON을 받아오는 방식은 API 응답 안에서 이미지 URL 같은 데이터를 꺼낸 뒤, 그 값을 화면에 사용하는 방식이다.

### CATAAS URL이 깨진 이유

**질문:** 왜 `https://cataas.comhttps://cataas.com/...` 같은 URL이 만들어졌는가?

**답:** CATAAS의 `url` 응답이 이미 전체 URL인데 코드에서 다시 `https://cataas.com`을 붙였기 때문이다. API 응답이 전체 URL인지 상대 경로인지 확인하고, 상대 경로일 때만 도메인을 붙여야 한다.

### 사진이 한 번 뜬 뒤 다시 바뀐 이유

**질문:** 실행 후 사진이 로드되고 다시 다른 사진으로 바뀐 이유는 무엇인가?

**답:** `FutureBuilder`의 `future`에 `fetchCatImageUrl()`을 직접 넣으면 `build()`가 다시 호출될 때마다 새 API 요청이 생길 수 있다. CATAAS는 요청마다 랜덤 이미지를 주므로 사진이 바뀐다. `initState()`에서 `Future`를 한 번 만들고 `late final` 변수에 저장하면 같은 카드에서는 같은 요청 결과를 유지할 수 있다.

## 헷갈리기 쉬운 구분

- `http.get()`은 데이터를 가져오는 요청이고, `Image.network()`는 이미지 URL을 화면에 그리는 위젯이다.
- `jsonDecode()`는 문자열 JSON을 Dart 객체로 바꾸는 작업이다.
- `FutureBuilder`는 네트워크 요청을 직접 관리하는 서비스가 아니라, `Future` 상태에 따라 UI를 선택해 그리는 위젯이다.
- `build()`는 여러 번 호출될 수 있으므로 랜덤 API 호출 같은 부수 효과를 직접 만들기 좋은 위치가 아니다.
- `initState()`는 `State`가 처음 만들어질 때 한 번 실행되므로 초기 API 요청을 시작하기에 적합하다.

## 영어 축약어

- API: Application Programming Interface, 애플리케이션이 외부 기능이나 데이터를 요청하는 약속.
- JSON: JavaScript Object Notation, 서버와 앱이 데이터를 주고받을 때 자주 쓰는 문자열 기반 데이터 형식.
- HTTP: HyperText Transfer Protocol, 웹에서 요청과 응답을 주고받는 통신 규칙.

## 한 줄 복습

랜덤 이미지 API는 `http.get()`으로 JSON을 받아 URL을 꺼내고, 그 URL을 `Image.network()`에 넘기며, 반복 호출을 막기 위해 `Future`는 `initState()`에서 한 번 만든다.

## 다시 물어볼 질문

1. `FutureBuilder`의 `future`에 `fetchCatImageUrl()`을 직접 넣으면 어떤 문제가 생길 수 있는가?
2. CATAAS 응답의 `url`이 전체 URL인지 상대 경로인지 왜 확인해야 하는가?
3. `http.get()`, `jsonDecode()`, `Image.network()`는 각각 어떤 역할을 하는가?
