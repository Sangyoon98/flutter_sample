# 8단계 복습: 로딩/에러/재시도 UI

## 학습 출처

- FutureBuilder API: https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html
- AsyncSnapshot.hasError: https://api.flutter.dev/flutter/widgets/AsyncSnapshot/hasError.html
- Image.network: https://api.flutter.dev/flutter/widgets/Image/Image.network.html
- Flutter fetch data from the internet: https://docs.flutter.dev/cookbook/networking/fetch-data

## 핵심 요약

- `FutureBuilder`는 비동기 작업의 상태에 따라 다른 UI를 그릴 수 있다.
- `snapshot.connectionState == ConnectionState.waiting`은 아직 결과를 기다리는 상태다.
- `snapshot.hasError`는 `Future`가 실패했을 때 true가 된다.
- `snapshot.hasData`가 false라고 해서 항상 로딩은 아니다. 실패했거나 데이터가 없을 수도 있다.
- HTTP 응답의 `statusCode`가 성공이 아니면 `throw Exception(...)`으로 실패 상태를 만들 수 있다.
- `Image.network(errorBuilder: ...)`는 API 요청은 성공했지만 실제 이미지 파일 로딩이 실패한 경우를 처리한다.
- 재시도 버튼은 기존 `Future`를 재사용하지 않고 새 `Future`를 만들어 `setState()`로 화면을 다시 그리게 한다.

## 사용자 질문 기반 정리

### `hasData == false`를 전부 로딩으로 보면 위험한 이유

**질문:** `FutureBuilder`에서 `snapshot.hasData`가 false인 경우를 전부 로딩 상태로 보면 왜 위험한가?

**답:** 데이터가 아직 도착하지 않은 순간일 수도 있지만, 실패했거나 응답 데이터가 없는 상태일 수도 있다. 그래서 로딩은 `connectionState`, 실패는 `hasError`, 데이터 없음은 `!hasData`처럼 나눠서 보는 편이 안전하다.

### API 요청 실패와 이미지 로딩 실패의 차이

**질문:** API 요청 실패와 `Image.network()` 이미지 로딩 실패는 왜 같은 에러 처리로 잡기 어려운가?

**답:** API 요청 실패는 `http.get()`으로 JSON을 가져오는 `Future` 단계에서 발생한다. 반면 이미지 로딩 실패는 URL을 얻은 뒤 `Image.network()`가 실제 이미지 파일을 가져오는 단계에서 발생한다. 실패 위치가 다르기 때문에 `FutureBuilder`와 `Image.network(errorBuilder)`로 각각 처리한다.

### 재시도할 때 새 `Future`가 필요한 이유

**질문:** 재시도 버튼을 눌렀을 때 왜 기존 `_catImageUrlFuture`를 그대로 두면 안 되는가?

**답:** 기존 `Future`는 이미 성공이나 실패로 완료된 작업이다. 재시도하려면 새 API 요청을 만들어야 하므로 `_catImageUrlFuture = fetchCatImageUrl()`처럼 새 `Future`를 할당하고 `setState()`로 화면을 다시 빌드해야 한다.

## 헷갈리기 쉬운 구분

- `ConnectionState.waiting`은 아직 기다리는 상태다.
- `snapshot.hasError`는 `Future` 자체가 실패한 상태다.
- `!snapshot.hasData`는 성공 데이터가 없는 상태지만, 그 이유가 로딩인지 실패인지 따로 확인해야 한다.
- `FutureBuilder`의 에러 UI는 API 요청 실패를 처리한다.
- `Image.network(errorBuilder)`는 이미지 URL을 받은 뒤 이미지 파일 로딩 실패를 처리한다.
- `late final Future`는 한 번만 할당할 수 있으므로 재시도에는 맞지 않는다. 재시도하려면 `late Future`처럼 다시 할당 가능한 필드가 필요하다.

## 한 줄 복습

로딩, API 실패, 이미지 로딩 실패, 재시도는 각각 다른 상태이므로 `connectionState`, `hasError`, `errorBuilder`, 새 `Future` 생성으로 나눠 처리한다.

## 다시 물어볼 질문

1. `snapshot.hasData == false`만 보고 로딩 UI를 보여주면 어떤 문제가 생길 수 있는가?
2. `FutureBuilder`의 에러 처리와 `Image.network(errorBuilder)`는 각각 어떤 실패를 처리하는가?
3. 재시도 버튼에서 `_catImageUrlFuture = fetchCatImageUrl()`를 다시 실행해야 하는 이유는 무엇인가?
