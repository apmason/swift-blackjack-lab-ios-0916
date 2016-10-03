//
//  AppDelegate.swift
//  swift-blackjack-lab
//
//  Created by Flatiron School on 7/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /**
     
     * Declare any custom properties here.
     
     */
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /*
         
         * Call your custom classes here when running the scheme.
         
         */
        var dealer = Dealer()
        func playBlackjack(withBet amount: UInt) {
            //print("The player has \(dealer.player.tokens) tokens")
            dealer.deck.shuffle()
            dealer.place(bet: amount)
            print("Dealer bet placement \(dealer.place(bet: amount))")
            dealer.deal()
            print("Dealer handscore is \(dealer.house.handscore)")
            print("Player handscore is \(dealer.player.handscore)")
            
            if dealer.player.mayHit || dealer.house.mayHit {
                dealer.turn(house: dealer.player)
                print("Player through if loop, score is: \(dealer.player.handscore)")
                
                
                dealer.turn(house: dealer.house)
                print("Dealer through if loop, score is: \(dealer.house.handscore)")
                
                print("The player has \(dealer.player.tokens) tokens")
                
                dealer.winner()
                dealer.award()
                //print(dealer.winner())
                //print(dealer.award())
                
                print("Player amount: \(dealer.player.tokens)")
                print("Dealer amount: \(dealer.house.tokens)")
            }
            
            
            
        }
        
        playBlackjack(withBet: 20)
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /*
     
     * Write your playBlackjack method in here
     
     */
    
}

