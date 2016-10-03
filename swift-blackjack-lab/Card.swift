//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Alexander Mason on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    let cardLabel: String
    var cardValue: UInt = 0
    var description: String {
        return cardLabel
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(self.suit)\(self.rank)"
        self.cardValue = determineCardValue(rank)
    }
    
    class func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    class func validRanks() -> [String] {
        return ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    }
    
//    func description() -> String {
//        return cardLabel
//    }
    
    func determineCardValue(_ rank: String) -> UInt {
        switch rank {
        case "A":
            return 1
            
        case "K", "Q", "J", "10":
            return 10
            
        case "9":
            return 9
            
        case "8":
            return 8
            
        case "7":
            return 7
            
        case "6":
            return 6
            
        case "5":
            return 5
            
        case "4":
            return 4
            
        case "3":
            return 3
            
        case "2":
            return 2
            
        default:
            return 1
        }
    }
}
