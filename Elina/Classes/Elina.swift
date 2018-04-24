//
//  Elina.swift
//  Elina
//
//  Created by 이씨안 on 2018. 4. 24..
//  Copyright © 2018년 elina. All rights reserved.
//

import Foundation

var _ELINA_MAXIMUM_DRINK_AMOUNT_: Double {
    return 1
}

enum ELState {
    case normal
    case gaming
    case drunken
}

class ELScripts {
    
    var general: [String] {
        return [
            "트위터는 흑역사를 만들기 매우 좋은 곳",
            "나도 인생을 살아야하는데"
            //add more Elina's cutty speechs here.
        ]
    }
    
    var rhythmGame: [String] {
        return [
            "19렙 PUC!!!"
            //add more Elina's cutty speechs here.
        ]
    }
    
    var drunken: [String] {
        return [
            "여러분 엘리나쨩귀엽죠???? 저도그렇게생각해요 세상에서제일귀여워 깨물어주고시퍼 꺄아앙♥",
            "귀여운 엘리나쨩이 간만에 술마셔쪄!! 헤헤헤 칭찬해줘어어 호메뗴 호메떼!!! ♡",
            "ㅈ진짜 미치겠네 이걸 마시고 취하는새럼이 어딨어 나진짜 아 ㅠㅠ 어디가서 술마신다고 하면 안되겟따...",
            "안녀엉ㅇ 엘리나쨩 또 술마셨어요!! 헤헿 어떻게 막걸리 한병 1.2리터를 마시고 기분이 팍 좋아져버리고 걷는길제대로못걷냐 미치겠네 진짜ㅋㅋㅋㅋㅋㅋㅋㅋㅋ",
            "죄송해요 이런 소란을 다피우고ㅠㅠㅠㅠ 그냥 발닦고 잘께요 엘리나냥ㅇ 우유먹고 자자아ㅏ!!",
            "기여운 엘리나냥 데려가서 키우실분!!! 분양비는 무료다냐아아앙 헤ㅔ헤 ♡",
            "냐아어앙 엘리나냥으로 바꿔버려야겠다냐아아!!!",
            "냥냥이귀엽져!!!! 엘리나냥도 짱귀여워여여ㅕㅓ어엉어ㅓ💕💕💕",
            "냐아아앙 엘리나냥이 모두를 지켜줄꺼라냐아아아!!!",
            "댕커여운 엘리나냥은 진짜루자러갈께냐아아아💕💕",
            "솔직히님들도 엘리나냥 기대하잖아요 내가 되어주면되는거지!!!!!!!"
            //add more Elina's cutty speechs here.
        ]
    }
}

enum SNS: String {
    case twitter = "Twitter"
    case facebook = "Facebook"
}

public class Elina {
    
    private let scripts = ELScripts()
    
    private struct Posts {
        var postIndex: String
    }
    
    private var twitterPosts: [Posts] = []
    private var facebookPosts: [Posts] = []
    
    public var alcohol: Double
    private var state: ELState
    
    public init() {
        alcohol = 0
        state = .normal
    }
    
    public init(drink amount: Double) {
        if amount >= _ELINA_MAXIMUM_DRINK_AMOUNT_ {
            self.alcohol = _ELINA_MAXIMUM_DRINK_AMOUNT_
            self.state = .drunken
        } else {
            if amount < 0 {
                alcohol = 0
            } else {
                alcohol = amount
            }
            state = .normal
        }
    }
    
    public func relieveHangover() {
        alcohol = 0
        state = .normal
    }
    
    // MARK: - Drink
    public func drink(amount: Double) {
        
        if alcohol < 0 {
            alcohol = 0
            state = .normal
            
            return
        }
        
        self.alcohol += amount
        
        if alcohol >= _ELINA_MAXIMUM_DRINK_AMOUNT_{
            alcohol = _ELINA_MAXIMUM_DRINK_AMOUNT_
            state = .drunken
        } else {
            state = .normal
        }
    }
    
    // MARK: - Game
    public func startGame() {
        state = .gaming
    }
    
    public func stopGame() {
        if alcohol == _ELINA_MAXIMUM_DRINK_AMOUNT_{
            state = .drunken
        } else {
            state = .normal
        }
    }
    
    // MARK: - Post
    public func postSomething() {
        var indexString: String {
            switch state {
            case .normal:
                return chooseRandom(from: scripts.general)
            case .gaming:
                return chooseRandom(from: scripts.rhythmGame)
            case .drunken:
                return chooseRandom(from: scripts.drunken)
            }
        }
        switch chooseSnsByState() {
        case .twitter:
            twitterPosts.append(Posts(postIndex: indexString))
        case .facebook:
            facebookPosts.append(Posts(postIndex: indexString))
        }
    }
    
    private func chooseRandom(from array: [String]) -> String {
        return array[Int(arc4random_uniform(UInt32(array.count)))]
    }
    
    private func chooseSnsByState()-> SNS {
        var avaliabilityOfChoosingFacebook: Int {
            switch self.state {
            case .normal:
                return 46
            case .gaming:
                return 27
            case .drunken:
                return 3
            }
        }
        
        if Int(arc4random_uniform(100)) > avaliabilityOfChoosingFacebook {
            return .twitter
        } else {
            return .facebook
        }
    }
    
    private func postScript(at sns:SNS, script: [String])-> String {
        var uploadProfileAndTypeBySns:(String, String) {
            switch sns {
            case .facebook:
                return ("김**", "업로드")
            case .twitter:
                return ("Elina", "트윗")
            }
        }
        return "\(uploadProfileAndTypeBySns.0)님이 \(sns.rawValue)에 \(uploadProfileAndTypeBySns.1) : \(script[Int(arc4random_uniform(UInt32(script.count)))])"
    }
    
    // MARK: - Get SNS Post
    func recentPost(of sns: SNS) -> String? {
        switch sns {
        case .facebook:
            return self.facebookPosts.first?.postIndex
        case .twitter:
            return self.twitterPosts.first?.postIndex
        }
    }
}
