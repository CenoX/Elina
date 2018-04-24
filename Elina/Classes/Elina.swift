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



