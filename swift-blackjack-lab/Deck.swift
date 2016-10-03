//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Alexander Mason on 9/29/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards = [Card]()
    private var undealtCards = [Card]()
    var description: String {
        return cardDescription()
    }
    
    init() {
        self.undealtCards = generateCards()
        self.dealtCards = [Card]()
        print("\(undealtCards.count) testing array")
        //print(arc4random_uniform(51))
        //print(arc4random_uniform(51))
        
    }
    
    func drawCard() -> Card {
        let removedValue = undealtCards.removeLast()
        //print("\(undealtCards.count) after drawCard")
        dealtCards.append(removedValue)
        return removedValue
    }
    
    func shuffle() {
        undealtCards += dealtCards
        //print("\(undealtCards.count) at very beginning of shuffle ")
        dealtCards = [Card]()
        //print("\(undealtCards.count) at beginning of shuffle ")
        for i in undealtCards {
            let undealtValue = i
            undealtCards.removeFirst()
            undealtCards.insert(undealtValue, at: Int(arc4random_uniform(51)))
            //print(undealtCards[0].cardLabel)
        }
        // print(undealtCards[0].cardLabel)
    }
    
    
    func generateCards() -> [Card] {
        let suitArray = ["♠︎", "♥︎", "♦︎", "♣︎"]
        let numberArray = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        var defaultArray = [Card]()
        for suit in suitArray {
            for number in numberArray {
                let newValue = Card(suit: suit, rank: number)
                defaultArray.append(newValue)
            }
        }
        return defaultArray
    }
    
    func cardDescription() -> String {
        return "Cards Remaining: \(undealtCards.count) Cards Dealt: \(dealtCards.count)"
    }
    
}


private func countDecks(undealt: [String], dealt: [String]) -> String {
    let undealtNumber = undealt.count
    let dealtNumber = dealt.count
    return "Cards Remaining: \(undealtNumber)" + "\n" + "Cards Dealt: \(dealtNumber)"
}
