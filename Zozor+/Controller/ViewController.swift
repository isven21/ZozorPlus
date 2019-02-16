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
    // Action touch up inside on number Button
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
    // Action touch up inside on operator Button
    @IBAction func tapOperatorButtons(_ sender: UIButton) {
            switch sender.tag {
            case 0:
                    textView.text = countManager.plus()
            case 1:
                    textView.text = countManager.minus()
            case 2:
                    textView.text = countManager.calculateTotal()
            case 3:
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
