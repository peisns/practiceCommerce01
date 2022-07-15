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
        }

    }

    @IBAction func idTextFieldTyped(_ sender: UITextField) {
        let userWord = idTextField.text?.lowercased()
        let count = userWord!.count
        if userWord == "" {
            idTextFieldDescription.text = "아이디는 필수입력 정보입니다."
        } else if count < 5 {
            idTextFieldDescription.text = "아이디는 5글자 이상이어야 합니다."
        } else if count >= 5 && count <= 12 {
            idTextFieldDescription.text = "아이디글자 수 충족."
        } else if count > 12 {
            idTextFieldDescription.text = "아이디는 12글자 이하이어야 합니다."
        } else {
            idTextFieldDescription.text = "에러가 발생했습니다."
        }
        
        idTextFieldDescription.isHidden = false
    }
    
}

