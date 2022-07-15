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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for label in defaultHiddenCollection {
            label.isHidden = true
            idTextFieldDescription.textColor = .red
        }

    }

    @IBAction func idTextFieldTyped(_ sender: UITextField) {
        idTextFieldDescription.isHidden = false
        
        let userWord = idTextField.text?.lowercased()
        idTextField.text = userWord
        
        let count = userWord!.count
        if userWord == "" {
            idTextFieldDescription.text = "아이디는 필수입력 정보입니다."
        } else if count < 5 {
            idTextFieldDescription.text = "아이디는 5글자 이상이어야 합니다."
        } else if count >= 5 && count <= 12 {
            let idPattern = "^[a-z0-9-_]{5,12}$"
            let isVaildPattern = (userWord!.range(of: idPattern, options: .regularExpression) != nil)
            if isVaildPattern {
                idTextFieldDescription.text = "조건에 맞는 아이디"
                idTextFieldDescription.isHidden = true
            } else {
                idTextFieldDescription.text = "소문자, 숫자, 빼기(-), 밑줄(_)만 사용할 수 있습니다."
            }
        } else if count > 12 {
            idTextFieldDescription.text = "아이디는 12글자 이하이어야 합니다."
        } else {
            idTextFieldDescription.text = "에러가 발생했습니다."
        }
    }
    
    @IBAction func passwordTextFieldTyped(_ sender: UITextField) {
    }
    
    
    
    
}

