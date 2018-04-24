//
//  Elina.swift
//  Elina
//
//  Created by 이씨안 on 2018. 4. 24..
//  Copyright © 2018년 elina. All rights reserved.
//

import Foundation

class Elina {
    enum State{
        case normal
        case drunken
    }
    
    enum Sns{
        case twitter
        case facebook
    }
    
    enum Topic{
        case rhythmGame
        case drunken
    }
    
    let drunkenScripts: [String] = [
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
    ]
    
    let rhythmScripts: [String] = [
        
    ]
    
    var alcohol: Double
    var state: State
    
    init() {
        self.alcohol = 0
        self.state = .normal
    }
    
    func drink(amount alcohol: Double) -> Void {
        self.alcohol = self.alcohol + alcohol
        
        if self.alcohol >= 200{
            feel(like: .drunken)
        }
        
    }
    
    func feel(like state: State) -> Void {
        switch state {
        case .normal:
            write(at: .facebook, about: .rhythmGame)
            write(at: .twitter, about: .rhythmGame)
        case .drunken:
            write(at: .twitter, about: .drunken)
        }
    }
    
    func write(at sns: Sns, about topic: Topic)-> Void{
        switch topic {
        case .rhythmGame:
            post(at: sns, "19렙 PUC!!!!!!!!!!")
        case .drunken:
            randomPost(at: sns, with: drunkenScripts)
        }
    }
    
    private func randomPost(at sns:Sns, with scripts: [String]){
        post(at: sns, scripts[Int(arc4random_uniform(UInt32(scripts.count)))])
    }
    
    private func post(at sns:Sns, _ context: String){
        switch sns {
        case .facebook:
            print("Elina님이 Facebook에 업로드 : \(context)")
        case .twitter:
            print("Elina님이 Twitter에 트윗 : \(context)")
        }
    }
}



