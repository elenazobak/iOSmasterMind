//
//  InputHistory.swift
//  masterMind
//
//  Created by Elena Zobak on 3/31/23.
//

import Foundation

class InputHistory {
    var userInput: String
    var result: (Int, Int)
    
    init(userInput: String, result: (Int, Int)) {
        self.userInput = userInput
        self.result = result
    }
}
