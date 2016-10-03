//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Alexander Mason on 9/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var cards: [Card] = [Card]()
    var handscore: UInt {
        var currentValue: UInt = 0
                for i in cards {
                    currentValue += i.cardValue
                }
                for i in cards {
                    if i.rank == "A" && currentValue <= 11 {
                        currentValue += 10
                    }
        }
                return currentValue
    }

    var blackjack: Bool {
        return cards.count == 2 && handscore == 21
    }
    var busted: Bool {
        return handscore > 21
    }
    var stayed: Bool
    var mayHit: Bool {
        return busted == false && blackjack == false && stayed == false
    }
    public var tokens: UInt
//        {
//        get {
//            self.tokens = tokens
//        }
//    }
    var description: String {
        return "player : \(name), cards :  \(cards), handscore : \(handscore),blackjacke :  \(blackjack),busted : \(busted),stayed :    \(stayed), \(mayHit), tokens : \(tokens)"
    }
    
    init(name: String) {
        self.name = name
        //self.tokens = tokens
        self.stayed = false
        self.tokens = 100
    }
    
    func canPlace(bet amount: UInt) -> Bool {
        return amount <= tokens
    }
    
    func didWin(bet: UInt) {
        print("didWin called")
        print("The winner has \(tokens) tokens before tokens is called")
        tokens += bet
        print("The winner has \(tokens) tokens")
    }
    
    func didLose(bet: UInt) {
        print("didLose called")
        tokens -= bet
    }

}










