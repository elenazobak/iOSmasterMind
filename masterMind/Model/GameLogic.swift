//
//  GameBrain.swift
//  masterMind
//
//  Created by Elena Zobak on 3/30/23.
//

import Foundation

class GameLogic {
    
    static func checkUserSubmit(userInputCode: inout String, code: String) -> (Int, Int) {
       
        // Create a dictionary to store the counts of each digit in the code
        var numberObj = [Character: Int]()
        var tempUserInput = userInputCode
        // Initialize the counts to 0
        var numAndLocation = 0
        var onlyNum = 0
        
        // Check for well-positioned digits
        for i in code.indices {
            // Counts the well-positioned digits and replaces them with a space in the user input code
            if code[i] == tempUserInput[i] {
                numAndLocation += 1
                tempUserInput.replaceSubrange(i...i, with: " ")
            } else {
                // Counts the number of occurrences of each digit in the code
                if let count = numberObj[code[i]] {
                    numberObj[code[i]] = count + 1
                } else {
                    numberObj[code[i]] = 1
                }
            }
        }
        
        // Check for wrong-positioned digits
        for j in userInputCode.indices {
            // If the digit is in the dictionary, increment the count of correct digits
            if let count = numberObj[userInputCode[j]] {
                onlyNum += 1
                // If there is only one occurrence, remove the key-value pair from the dictionary
                if count == 1 {
                    numberObj[userInputCode[j]] = nil
                // Otherwise, decrement the count
                } else {
                    numberObj[userInputCode[j]] = count - 1
                }
            }
        }
        
        // Return a tuple with the values of numAndLocation and correctNum
        return (numAndLocation, onlyNum)
    }
    
    
    
}
