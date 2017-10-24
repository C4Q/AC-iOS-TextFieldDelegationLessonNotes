//
//  ViewController.swift
//  TextFieldsAndDelegationClassNotes
//
//  Created by C4Q  on 10/24/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    var model = GuessingGameModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guessTextField.delegate = self
        //self is an instance of ViewController that the user is currently working with
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return false
        }
        guard let textAsInt = Int(text) else {
            messageLabel.text = "\(text) is not a valid input"
            messageLabel.isHidden = false
            return false
        }
        switch model.guess(textAsInt) {
        case .tooLow:
            messageLabel.text = "\(textAsInt) is too low"
        case .tooHigh:
            messageLabel.text = "\(textAsInt) is too high"
        case .correct:
            messageLabel.text = "\(textAsInt) is correct!"
        case .alreadyGuessed:
            messageLabel.text = "You have already guessed \(textAsInt)!"
        }
        messageLabel.isHidden = false
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        print(range.lowerBound, range.upperBound, string)
        if string == "" {
            return true
        }
        guard let _ = Int(string) else {
            return false
        }
        return true
    }
    
    /*
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should begin")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Should change")
        print("range: \(range.lowerBound)-\(range.upperBound)")
        print("string: \(string)")
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Should clear")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should end")
        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        print("Did end")
        switch reason {
        case .committed:
            print("Because committed")
        default:
            print("Because another thing")
        }
    }
     */
}

