# Elina

[![CI Status](http://img.shields.io/travis/Cyanide7523/Elina.svg?style=flat)](https://travis-ci.org/Cyanide7523/Elina)
[![Version](https://img.shields.io/cocoapods/v/Elina.svg?style=flat)](http://cocoapods.org/pods/Elina)
[![License](https://img.shields.io/cocoapods/l/Elina.svg?style=flat)](http://cocoapods.org/pods/Elina)
[![Platform](https://img.shields.io/cocoapods/p/Elina.svg?style=flat)](http://cocoapods.org/pods/Elina)

**이 프로젝트는 암묵의 룰에 따라 모든 커밋의 제목을 "엘리나냥 기여워~"로 통합하는 것을 원칙으로 합니다.**

## Overview

엘리나냥 프로젝트는 초 카와이 엘리나냥의 커여움을 세계 모두가 알게하기 위한 프로젝트입니다.

CREDIT TO :
* [엘리나](https://twitter.com/DE_v_Elina) 본인
* [jepark-diary.tistory.com](http://jepark-diary.tistory.com/13) Pod 구현 관련하여 많이 참고하였습니다.

## Requirements

* ~~엘리나냥의 귀여움에도 심쿵하지 않고 버텨낼 강한 정신력~~ 너무 과도한 귀여움으로 세계의 누구도 해내지 못하여 문단을 삭제

## How to use this?

Elina의 기본적인 기능은 귀여운 Elina의 대박심쿵초카와이짱짱마제스티커여움을 자랑하는 어록들을 둘러볼 수 있도록 해줍니다.

기본적으로, Elina 객체를 생성합니다.

```Swift
let elina: Elina = Elina()

// 옵션을 통해 엘리나의 상태에 변화를 준 채 생성하는 것도 가능합니다.
// 예를들면, 이 경우에는 엘리나를 술을 꽤 먹인채로 생성합니다.
let drunkenElina = Elina(drink: 0.8)
```

Elina 객체에는 갖가지 영향을 줄 수 있습니다. 이를테면 `drink(amount: )`함수로 귀여운 엘리나냥을 취하게 만들 수도 있습니다. `startgame()`함수로 엘리나냥이 좋아하는 사운드볼텍스를 플레이 하게 해줄 수도 있지요.

Elina에게 가하는 영향은 Elina의 `state`에 영향을 줍니다.

`state`값은, 엘리나가 SNS에 올릴 글을 결정합니다.

다음은 엘리나에게 술을 먹이고 SNS에 글을 올리게 하는 코드입니다.

```Swift
//우리 귀여운 엘리나냥을 생성합니다.
let elina: Elina = Elina()

//우리 귀여운 엘리나냥에게 술을 듬뿍 먹여줍니다
elina.drink(amount: 999999)

//우리 귀여운 엘리나냥이 SNS에 포스트를 합니다
elina.postSomething()
```

엘리나냥은 두개의 SNS 계정을 사용합니다 Facebook 과 Twitter 이죠. 상기한 `state` 값은 둘 중 어느 SNS에 글을 올릴 지 또한 결정합니다. 반드시 둘중 하나를 정하나, `state`에 따라 어느 한 쪽을 고를지에 대한 확률이 커지지요.

방금의 예제에선, 엘리나냥이 만취했으므로 높은 확률로 Twitter에 트윗했을 것입니다. 엘리나냥이 각 SNS에 올린 포스트는 다음과 같은 방법으로 확인할 수 있습니다.

```Swift
print(elina.twitterPosts[0].postIndex)
```

```
실행결과
----------

```

어? 트위터엔 아무것도 올리지 않았어요!

그렇다면... 설마...

```Swift
print(elina.facebookPosts[0].postIndex)
```

```
실행결과
----------
여러분 엘리나쨩귀엽죠???? 저도그렇게생각해요 세상에서제일귀여워 깨물어주고시퍼 꺄아앙♥
```

저런... 너무나 취한 나머지.... 결국.... 페이스북에.....


## Where should I use this?

엘리나냥의 귀여움을 모두에게 전파하세요! 

개인 프로젝트를 비롯하여, 사내 프로젝트, 정부/공공기관, 재단, 그 외 등등 에 엘리나냥의 귀여움을 **몰래** 심으세요! 

설령 들켰다 한들 **엘리나냥의 압도적인 귀여움**에 여러분의 파트너, 상사, 대표님, 대통령님, 우주인 조차 여러분에게 책임을 물지 않을 것입니다! 왜냐하면 엘리나냥은 귀엽거든요.

## Installation

Elina는 [CocoaPods](http://cocoapods.org)를 지원합니다! 당신만의 귀여운 엘리나냥을 만나보세요! 간단히 `Podfile`에 :

```ruby
pod 'Elina', '~> 0.4.0'
```

만 입력하시면 됩니다!

## Author

Cyanide7523, ffasang123@icloud.com

## License

Elina는 MIT license가 적용되어 있습니다. 라이선스에 관한 정보는 LICENSE 파일에서 확인해주세요.

## Why does '엘리나냥' is kawaii?

왜냐하면 엘리나냥은 귀엽기 때문입니다.
