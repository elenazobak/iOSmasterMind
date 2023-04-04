//
//  InputHistory.swift
//  masterMind
//
//  Created by Elena Zobak on 3/31/23.
//

import Foundation

class InputHistoryModel {
    var userInput: String
    var numAndLocation: Int
    var onlyNum: Int
    
    init(userInput: String, result: (Int, Int)) {
        self.userInput = userInput
        self.numAndLocation = result.0
        self.onlyNum = result.1
    }
}
