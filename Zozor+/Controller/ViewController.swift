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
                    textView.text = countManager.addNewNumber(number)
            }
    }
    @IBAction func tapOperatorButtons(_ sender: UIButton) {
            switch sender.tag {
            case 0:
                    textView.text = countManager.plus()
            case 1:
                    textView.text = countManager.minus()
            case 2:
                    textView.text = countManager.calculateTotal()
            default:
                break
            }
    }
    @IBAction func tapClearButton() {
         textView.text = countManager.clear()
    }
}

extension ViewController: alertVCPopUp {
    func alertVC(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
