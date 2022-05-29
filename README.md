# Clone-Calculator
Clone iPhone default calculator for study (CultureCenter1 - 1st week) 

### 기본 계산기 앱 클론코딩
🎯 Goal: UI와 로직 구현
 - 주요 목표: (1) 코드리뷰 받기 (2) UI와 로직 연결을 스파게티 아니게 구현하기 (UI보다 로직에 중심)
   - 추가 목표: SwiftLint, UI 똑같이 하기, UIKit, 깃 CLI로 하기
 - 안하는 것: 가로모드, 공학용 계산기는 안함
 
프레임워크: SwiftUI (UIKit 알아봤으나 시간과 목표상 다음에)

구현할 기능:
  - 계산
    - 사칙연산 (연산자 순서 포함)
    - 계산불가시 "오류" 출력
    - +/-, %
  - '.' 이미 0.3 있을 때 눌러도 입력 안 되기
  - 각 버튼별 기능
 추가구현할 기능:
  - 숫자를 길게 눌러서 복사
    - 안할 관련 기능: 앱 밖에서도 길게 눌러서 결과 복사, 제어센터에서 복사
  - 스와이프로 마지막 입력 숫자 없애기
 구현할 UI
  - 눌리면 색 변해있는 사칙연산 버튼
  - 혼자 긴 0 버튼
  - AC <-> C 버튼 전환
