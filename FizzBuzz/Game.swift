//
//  Game.swift
//  FizzBuzz
//
//  Created by Konstantinos M on 7/2/17.
//  Copyright © 2017 Lumicsoft. All rights reserved.
//

import Foundation

class Game: NSObject {

    var score: Int
    let brain: Brain
    
    override init() {
        score = 0
        brain = Brain()
        super.init()
    }

    func play(move: Move) -> (right: Bool, score: Int) {
        let result = brain.check(number: score + 1)
        
        if (move == Move.Restart) {
            score=0
            return (true, score)
        } else if result == move {
            score+=1
            return (true, score)
        } else {
            return (false, score)
        }
    }
}
