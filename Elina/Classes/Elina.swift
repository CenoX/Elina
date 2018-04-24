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

enum ELState{
    case normal
    case gaming
    case drunken
}

class ELScripts{
    
    @nonobjc class var general: [String]{
        return [
            "트위터는 흑역사를 만들기 매우 좋은 곳",
            "나도 인생을 살아야하는데"
            //add more Elina's cutty speechs here.
        ]
    }
    
    @nonobjc class var rhythmGame: [String]{
        return [
            "19렙 PUC!!!"
            //add more Elina's cutty speechs here.
        ]
    }
    
    @nonobjc class var drunken: [String]{
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


class Elina {
    
    enum Sns: String{
        case twitter = "Twitter"
        case facebook = "Facebook"
    }
    
    
    
    struct Posts{
        var postIndex: String
    }
    
    var twitterPosts: [Posts] = []
    var facebookPosts: [Posts] = []
    
    var alcohol: Double
    fileprivate var state: ELState
    
    
    
    init() {
        self.alcohol = 0
        self.state = .normal
    }
    
    init(drink amount: Double) {
        if amount >= _ELINA_MAXIMUM_DRINK_AMOUNT_ {
            self.alcohol = _ELINA_MAXIMUM_DRINK_AMOUNT_
            self.state = .drunken
        }else{
            if amount < 0 {
                self.alcohol = 0
            }else{
                
                self.alcohol = amount
            }
            self.state = .normal
        }
    }
    
    
    func drink(_ amount: Double){
        if amount < 0 {
            self.alcohol = 0
        }
        else if amount >= _ELINA_MAXIMUM_DRINK_AMOUNT_{
            self.alcohol = _ELINA_MAXIMUM_DRINK_AMOUNT_
            self.state = .drunken
        }
        else{
            self.alcohol = amount
        }
    }
    
    func startGame(){
        self.state = .gaming
    }
    
    func stopGame(){
        if alcohol == _ELINA_MAXIMUM_DRINK_AMOUNT_{
            state = .drunken
        }
        else{
            state = .normal
        }
    }
    
    func postSomething(){
        
        var indexString: String{
            switch state{
            case .normal:
                return ELScripts.general[Int(arc4random_uniform(UInt32(Int32(ELScripts.general.count))))]
            case .gaming:
                return ELScripts.rhythmGame[Int(arc4random_uniform(UInt32(ELScripts.rhythmGame.count)))]
            case .drunken:
                return ELScripts.drunken[Int(arc4random_uniform(UInt32(ELScripts.drunken.count)))]
            }
        }
        switch chooseSnsByState() {
        case .twitter:
            twitterPosts.append(Posts(postIndex: indexString))
        case .facebook:
            facebookPosts.append(Posts(postIndex: indexString))
        }
    }
    
    private func chooseSnsByState()-> Sns{
        var avaliabilityOfChoosingFacebook: Int{
            switch self.state {
            case .normal:
                return 46
            case .gaming:
                return 27
            case .drunken:
                return 3
            }
        }
        
        if arc4random_uniform(100) > avaliabilityOfChoosingFacebook{
            return .twitter
        }else{
            return .facebook
        }
    }
    
    
    
    private func postScript(at sns:Sns, script: [String])-> String{
        var uploadProfileAndTypeBySns:(String, String){
            switch sns {
            case .facebook:
                return ("김**", "업로드")
            case .twitter:
                return ("Elina", "트윗")
            }
        }
        return "\(uploadProfileAndTypeBySns.0)님이 \(sns.rawValue)에 \(uploadProfileAndTypeBySns.1) : \(script[Int(arc4random_uniform(UInt32(script.count)))])"
    }
}



