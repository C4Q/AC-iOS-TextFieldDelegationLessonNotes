//
//  GuessingGameModel.swift
//  TextFieldsAndDelegationClassNotes
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum GuessResult {
    case tooHigh, tooLow, correct, alreadyGuessed
}

struct GuessingGameModel {
    //public api
    mutating func guess(_ guessedNum: Int) -> GuessResult {
        if !self.guessedNums.insert(guessedNum).inserted {
            return .alreadyGuessed
        }
        if guessedNum < winningNum {
            return .tooLow
        }
        if guessedNum > winningNum {
            return .tooHigh
        }
        return .correct
    }
    init() {
        let randInt = Int(arc4random_uniform(100))
        self.winningNum = randInt
    }
    
    //private implementation
    private let winningNum: Int
    private var guessedNums: Set<Int> = []
}
