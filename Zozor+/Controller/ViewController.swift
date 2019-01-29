//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Vars
    let countManager = CountManager()
    
    //MARK: - Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countManager.errorMessageDelegate = self
    }

    // MARK: - Action
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                textView.text = countManager.addNewNumber(i)
            }
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
        countManager.clear()
        textView.text = ""
    }
}

extension ViewController: ErrorMessage {
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
