//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Vars
    let countManager = CountManager()
    // MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
        countManager.alertVCPopUpDelegate = self
    }

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (number, numberButton) in numberButtons.enumerated() where sender == numberButton {
            if textView.text.contains("=") {
                countManager.reset()
                textView.text = countManager.addNewNumber(number)
            } else {
                textView.text = countManager.addNewNumber(number)
            }
        }
    }
    @IBAction func tapOperatorButtons(_ sender: UIButton) {
            switch sender.title(for: .normal) {
            case "+":
                    textView.text = countManager.plus()
            case "-":
                    textView.text = countManager.minus()
            case "=":
                    textView.text = countManager.calculateTotal()
            case "Discount %":
                    textView.text = countManager.calculateNumberWithDiscount()
                    countManager.reset()
            default:
                break
            }
    }
}
extension ViewController: AlertVCPopUp {
    func alertVC(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
