//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Alexander Mason on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
class Dealer {
    var deck: Deck = Deck()
    let house = House(name: "House")
    let player = House(name: "Player")
    var bet: UInt = 0
    
    init() {
    }
    
    func place(bet amount: UInt) -> Bool {
        if house.canPlace(bet: amount) && player.canPlace(bet: amount) {
            bet = amount
            print("The bet is \(bet)")
            return true
        }   else {
            return false
        }
    }
    
    func deal() {
        player.stayed = false
        house.stayed = false
        
        house.cards.removeAll()
        player.cards.removeAll()
        
        player.cards.append(deck.drawCard())
        print("Player \(player.cards[0].cardLabel) ")
        house.cards.append(deck.drawCard())
        print("House \(house.cards[0].cardLabel) ")
        player.cards.append(deck.drawCard())
        print("Player \(player.cards[1].cardLabel) ")
        house.cards.append(deck.drawCard())
        print("House \(house.cards[1].cardLabel) ")
    }
    
    func turn(house: House) {
        if house.mayHit && house.handscore < 17 {
            house.cards.append(deck.drawCard())
        }   else {
            house.stayed = true
        }
    }
    
    func winner() -> String {
        if house.busted {
            print("Player is winner")
            return "player"
        }
        
        else if player.busted {
            print("House is winner")
            return "house"
        }
            
        else if player.blackjack {
            print("Player is winner")
            return "player"
        }
            
        else if house.blackjack {
            print("House is winner")
            return "house"
        }
            
        else if (house.stayed == true) && (player.stayed == true) && (house.handscore == player.handscore) {
            print("House is winner")
            return "house"
        }
        
        else if (player.busted == false) && (player.cards.count >= 5) {
            print("Player is winner")
            return "player"
        }
        
        else if house.stayed == true && player.stayed == true {
            if house.handscore > player.handscore {
                print("House is winner")
                return "house"
            } else {
                print("Player is winner")
                return "player"
            }
        }
        return "no"
    }
    
    func award() -> String {
        if winner() == "house" {
            house.didWin(bet: bet)
            player.didLose(bet: bet)
            return "The house wins \(bet) tokens!"
        } else if winner() == "player" {
            player.didWin(bet: bet)
            house.didLose(bet: bet)
            return "The player wins \(bet) tokens!"
        }
        return "no winner"
    }
    
    
    
}









