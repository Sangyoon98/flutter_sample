# Fluttergram Clone Target

이 문서는 Stitch UI zip과 CATAAS API를 기준으로 실제 구현 목표를 요약한다.

## 입력 자료

- Stitch zip: `/Users/sangyoon/Downloads/stitch_instagram_ui_clone.zip`
- 홈 피드 화면: `_2/screen.png`, `_2/code.html`
- Explore 화면: `_1/screen.png`, `_1/code.html`
- 디자인 토큰: `lumina_mobile/DESIGN.md`
- 고양이 이미지 API: https://cataas.com/

## 구현 범위

### 1차 구현: 홈 피드

목표:
- 인스타그램 홈 피드 일부를 Flutter로 구현한다.
- 피드 이미지는 CATAAS 랜덤 고양이 이미지를 사용한다.

화면 구성:
- top app bar
- story placeholder 영역
- post header
- post media
- action row
- likes
- caption
- comments link
- timestamp
- bottom navigation

우선순위:
1. 정적 레이아웃
2. 포스트 카드 위젯 분리
3. 더미 데이터 리스트
4. 좋아요/북마크 상태
5. CATAAS 이미지 연동
6. 로딩/에러/재시도

### 2차 구현: Explore

목표:
- 인스타그램 Explore 일부를 Flutter로 구현한다.

화면 구성:
- search bar
- location icon
- 3-column media grid
- overlay icon
- bottom navigation selected state

우선순위:
1. 정적 3열 grid
2. 검색 바 UI
3. 홈/검색 탭 전환
4. 랜덤 고양이 이미지 grid 적용

## 디자인 기준

- UI chrome은 최소화한다.
- 이미지가 주 콘텐츠가 되도록 한다.
- 기본 배경은 흰색 계열이다.
- 텍스트와 아이콘은 검정 중심이다.
- 보조 텍스트는 회색을 사용한다.
- spacing은 4px 단위로 잡는다.
- 텍스트 기반 영역의 좌우 기본 margin은 12px이다.
- media는 가로 full-bleed를 기본으로 한다.
- avatar는 원형이다.
- feed media는 모서리를 둥글게 하지 않는다.

## API 기준

CATAAS 공식 문서 기준:
- `/cat`: 랜덤 고양이 이미지
- `/cat?json=true`: 랜덤 고양이 JSON

Flutter 실습 기준:
- 1단계에서는 `Image.network('https://cataas.com/cat')`로 직접 표시할 수 있다.
- 네트워크/JSON 학습 단계에서는 `https://cataas.com/cat?json=true`를 호출하고 응답 `url`로 이미지 URL을 만든다.
- Android 실행을 위해 internet permission을 추가한다.

## 완료 기준

- 홈 피드 화면이 Stitch `_2`의 주요 구조와 일치한다.
- Explore 화면이 Stitch `_1`의 주요 구조와 일치한다.
- 피드 또는 grid에 랜덤 고양이 이미지가 표시된다.
- `flutter analyze`가 통과한다.
- `flutter test`가 통과한다.
