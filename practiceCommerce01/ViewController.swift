//
//  ViewController.swift
//  practiceCommerce01
//
//  Created by Brother Model on 2022/07/12.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var defaultHiddenCollection: [UILabel]!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var idTextFieldDescription: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordTextFieldDescription: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldDescription: UILabel!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var phoneNumberTextFieldDescription: UILabel!
    
    @IBOutlet weak var phoneNumberCheckTextField: UITextField!
    @IBOutlet weak var phoneNumberCheckTextFieldDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in defaultHiddenCollection {
            label.isHidden = true
            label.textColor = .red
        }

    }

    @IBAction func idTextFieldTyped(_ sender: UITextField) {
        idTextFieldDescription.isHidden = false
        
        let userWord = idTextField.text?.lowercased()
        idTextField.text = userWord
        
        let minCount = 5
        let maxCount = 12
        let count = userWord!.count

        switch count {
        case 0:
            idTextFieldDescription.text = "아이디는 필수입력 정보입니다."
        case 1..<minCount:
            idTextFieldDescription.text = "아이디는 5글자 이상이어야 합니다."
        case minCount...maxCount:
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isVaildPattern = (userWord!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                idTextFieldDescription.text = "조건에 맞는 아이디"
                idTextFieldDescription.isHidden = true
            } else {
                idTextFieldDescription.text = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
            }
        default:
            idTextFieldDescription.text = "아이디는 12글자 이하이어야 합니다."
        }
    }
    
    @IBAction func passwordTextFieldTyped(_ sender: UITextField) {
        passwordTextFieldDescription.isHidden = false
        
        let minCount = 8
        let maxCount = 16
        let count = passwordTextField.text!.count

        switch count {
        case 0:
            passwordTextFieldDescription.text = "비밀번호는 필수입력 정보입니다."
        case 1..<minCount:
            passwordTextFieldDescription.text = "비밀번호는 8글자 이상이어야 합니다."
        case minCount...maxCount:
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isVaildPattern = (passwordTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                passwordTextFieldDescription.text = "조건에 맞는 비밀번호"
                passwordTextFieldDescription.isHidden = true
            } else {
                passwordTextFieldDescription.text = "영어알파벳, 숫자, 특수문자가 필수로 입력되어야 합니다."
            }
        default:
            passwordTextFieldDescription.text = "비밀번호는 16글자 이하이어야 합니다."
        }
    }
    
    @IBAction func emailTextFieldTyped(_ sender: UITextField) {
        emailTextFieldDescription.isHidden = false
        
        let minCount = 5
        let maxCount = 50
        let count = emailTextField.text!.count

        switch count {
        case 0:
            emailTextFieldDescription.text = "이메일은 필수입력 정보입니다."
        case 1..<minCount:
            emailTextFieldDescription.text = "올바르지 않은 이메일형식입니다."
        case minCount...maxCount:
            let idPattern = "^[a-z0-9-_]{\(minCount),\(maxCount)}$"
            let isVaildPattern = (passwordTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                passwordTextFieldDescription.text = "조건에 맞는 비밀번호"
                passwordTextFieldDescription.isHidden = true
            } else {
                passwordTextFieldDescription.text = "영어알파벳, 숫자, 특수문자가 필수로 입력되어야 합니다."
            }
        default:
            passwordTextFieldDescription.text = "비밀번호는 16글자 이하이어야 합니다."
    }
    
    @IBAction func phoneTextFieldTyped(_ sender: UITextField) {
        phoneNumberTextFieldDescription.isHidden = false
    }
    
    @IBAction func phoneNumberCheckTextFieldTyped(_ sender: UITextField) {
        phoneNumberCheckTextFieldDescription.isHidden = false
    }
    
}

