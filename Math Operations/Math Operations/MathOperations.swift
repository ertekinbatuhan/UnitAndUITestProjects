//
//  MathOperations.swift
//  Math Operations
//
//  Created by Batuhan Berk Ertekin on 9.08.2024.
//

import Foundation

class MathOperations {
    
    func add(number1 : Int, number2 : Int)  -> Int {
        return number1 + number2
    }
        
    func subtract(number1 : Int ,number2 : Int) -> Int {
        return number1 - number2
    }
    
    func multiply(number1 : Int , number2 : Int) -> Int {
        return number1 * number2
    }
    
    func divide(number1: Int, number2: Int) -> Int {
        guard number2 != 0 else {
            return 0
        }
        return number1 / number2
    }
}
