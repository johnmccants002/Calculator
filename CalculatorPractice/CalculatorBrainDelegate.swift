//
//  CalculatorBrainDelegate.swift
//  CalculatorPractice
//
//  Created by John McCants on 5/29/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation

enum OperatorType : String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "x"
    case division = "÷"
}

class CalculatorBrain {
    
    var stringOne = ""
    var stringTwo = ""
    var operatorType : OperatorType?
    var operatorBool = false
    
    func operatorTapped(operatorString: String) {
        
        print(stringOne)
        if stringOne != ""{
        operatorBool = true
        } else {
            operatorBool = true
            stringOne = "0"
        }
        switch operatorString {
        case "+": self.operatorType = .addition 
        case "-": self.operatorType = .subtraction
        case "x": self.operatorType = .multiplication
        case "÷": self.operatorType = .division
        default:
            break
        }
    }
    
    func digitTapped(digit: String) -> String {
        print(stringTwo)
        if operatorBool == false {
            stringOne.append(digit)
            return stringOne
        } else if operatorBool == true {
                stringTwo.append(digit)
                return stringTwo
            }
        
        return ""
    
}
    
    func calculateEquation() -> String {
        
        
        guard let unwrappedStringOne = Double(stringOne) else {return "0"}
        guard let unwrappedStringTwo = Double(stringTwo) else {
            
            return "\(Double(unwrappedStringOne).removeZerosFromEnd())"}
        
        
        
        var calculation : Double
        
        
        switch operatorType {
        case .addition:
            calculation = unwrappedStringOne + unwrappedStringTwo
            print(unwrappedStringOne)
            print(unwrappedStringTwo)
            stringTwo = ""
            stringOne = "\(calculation.removeZerosFromEnd())"
            return stringOne
        case .subtraction:
            calculation = unwrappedStringOne - unwrappedStringTwo
            stringTwo = ""
            stringOne = "\(calculation.removeZerosFromEnd())"
            return stringOne
        case .multiplication:
            calculation = unwrappedStringOne * unwrappedStringTwo
            stringTwo = ""
            stringOne = "\(calculation.removeZerosFromEnd())"
            return stringOne
        case .division:
            calculation = unwrappedStringOne / unwrappedStringTwo
            stringTwo = ""
            stringOne = "\(calculation.removeZerosFromEnd())"
            return stringOne
        default:
            break
        }
        
        return ""
        
        
    }
    
    
    func clearEverything() {
        self.stringOne = ""
        self.stringTwo = ""
        self.operatorBool = false
    }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
