//
//  File.swift
//  CountOnMe
//
//  Created by iSven on 17/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

var operators: [String] = ["+"]
var stringNumbers: [String] = [String()]

class operators {
   
    
    
    
    func addOperators() {
        if canAddOperator { // -> Model
            operators.append("+")
            stringNumbers.append("")
            updateDisplay()
        }
    }

    
}

class numbers {

    
    
}

func addNewNumber(_ newNumber: Int) { // -> Model
    if let stringNumber = stringNumbers.last {
        var stringNumberMutable = stringNumber
        stringNumberMutable += "\(newNumber)"
        stringNumbers[stringNumbers.count-1] = stringNumberMutable
    }
    updateDisplay()
}

func updateDisplay() { // -> Model
    var text = ""
    for (i, stringNumber) in stringNumbers.enumerated() {
        // Add operator
        if i > 0 {
            text += operators[i]
        }
        // Add number
        text += stringNumber
    }
    textView.text = text
}

func clear() { // -> Model
    stringNumbers = [String()]
    operators = ["+"]
}
