//
//  CreditCardValidator.swift
//  
//
//  Created by Mike Horn on 11/12/18.
//

import Foundation
import UIKit

//  Credit card validation
//  Write a method that given a valid credit card number returns true

//  Validating a credit card number follows these steps:
//  1. Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit
//  2. Sum all doubled and untouched digits in the number
//  3. If that total is a multiple of 10, the number is valid

class CreditCardValidator {
    private var evenDigits = Int()
    private var oddDigits = Int()
    private var total = Int()
    
    func setTotal(_ sumOfEvenDigits: Int, _ sumOfOddDigits: Int) -> Int {
        return sumOfEvenDigits+sumOfOddDigits
    }
    
    func enumerateCardNumbers(_ cardNumbers: [Int]) {
        for (index, digit) in cardNumbers.enumerated() {
            if index % 2 == 0 {
                evenDigits += digit
            } else {
                oddDigits += (digit*2)
            }
        }
        
        total = setTotal(evenDigits, oddDigits)
    }
    
    func validate(_ cardNumber: String) -> Bool {
        
        let cardNumbers = cardNumber.reversed().filter({ $0 != " "}).compactMap({ Int(String($0)) })
        
        if (cardNumbers.count == 15) || (cardNumbers.count == 16) {
            
            enumerateCardNumbers(cardNumbers)
            
            if total % 10 == 0 {
                return true
            } else {
                return false
            }
            
        } else {
            print("number is less than 15 or 16 digits – terminate")
            return false
        }
    }
}

var ccValidator = CreditCardValidator()
var pass = ccValidator.validate("4408 0412 3456 7896")
print("The card is valid -", pass)
var fail = ccValidator.validate("1234 5678 1234 5678")
print("The card is valid -", fail)
var earlyTermination = ccValidator.validate("4408 0412 3456")
print("The card is valid -", earlyTermination)
