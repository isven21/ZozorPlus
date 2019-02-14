//
//  File.swift
//  CountOnMe
//
//  Created by iSven on 17/01/2019.
//  Copyright © 2019 Ambroise Collon. All rights reserved.
//

import Foundation

// MARK: - Protocol
protocol AlertVCPopUp: class {
    func alertVC(title: String, message: String)
}

class CountManager {
    // MARK: - Properties
    weak var alertVCPopUpDelegate: AlertVCPopUp?
    var operators: [String] = ["+"]
    var stringNumbers: [String] = [String()]
    // Call in calculateTotal() - alertPopup if invalid touch up inside
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    alertVCPopUpDelegate?.alertVC(title: "Zéro!", message: "Démarrez un nouveau calcul !")
                } else {
                    alertVCPopUpDelegate?.alertVC(title: "Zéro!", message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    // Call in plus() & minus() - alertPopup if invalid touch up inside
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                alertVCPopUpDelegate?.alertVC(title: "Zéro!", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    // Call in calculateNumberWithDiscount() - alertPopup if invalid touch up inside
    var canAddDiscount: Bool {
        if let stringOperator = operators.last {
            if stringOperator == "-" {
                return true
            }
        }
        alertVCPopUpDelegate?.alertVC(title: "Zéro!", message: "Entrez une expression correcte !")
        return false
    }
    // MARK: - Methods
    // Update display on text view
    private func updateDisplay() -> String {
        var text = ""
        for (num, stringNumber) in stringNumbers.enumerated() {
            // Add operator
            if num > 0 {
                text += operators[num]
            }
            // Add number
            text += stringNumber
        }
        return text
    }
    // Clear properties "operators" & "stringNumbers"
    func reset() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    // add up
    func plus() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    // subtract
    func minus() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    // Calculate result
    func calculateTotal() -> String {
        if !isExpressionCorrect {
            return ""
        }
        var total = 0
            for (num, stringNumber) in stringNumbers.enumerated() {
                if let number = Int(stringNumber) {
                    if operators[num] == "+" {
                        total += number
                    } else if operators[num] == "-" {
                        total -= number
                    }
                }
            }
        return "\(updateDisplay())=\(String(total))"
    }
    // add number
    func addNewNumber(_ newNumber: Int) -> String {
            if let stringNumber = stringNumbers.last {
                var stringNumberMutable = stringNumber
                stringNumberMutable += "\(newNumber)"
                stringNumbers[stringNumbers.count-1] = stringNumberMutable
            }
        return updateDisplay()
    }
    // Bonus discount button
    func calculateNumberWithDiscount() -> String {
        var stringNumberWithDiscount: Float = 0
        if canAddDiscount {
            let percentage = (100-(stringNumbers.last! as NSString).floatValue)/100.0
            stringNumberWithDiscount = (stringNumbers.first! as NSString).floatValue * percentage
        }
        return "\(String(stringNumberWithDiscount))"
    }

}
