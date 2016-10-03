//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Alexander Mason on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
class House: Player {
    var mustHit: Bool {
        return handscore < 17
    }
    
//    override var tokens: UInt {
//        tokens = 1000
//        return super.tokens
//    }
    
    override init(name: String) {
        super.init(name: name)
        self.tokens = 1000
    }
    
}
