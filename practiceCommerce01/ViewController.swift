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
    @IBOutlet weak var phoneNumberButton: UIButton!
    @IBOutlet weak var phoneNumberTextFieldDescription: UILabel!
    
    @IBOutlet weak var phoneNumberView: UIStackView!
    @IBOutlet weak var phoneNumberCheckTextField: UITextField!
    @IBOutlet weak var phoneNumberCheckButton: UIButton!
    @IBOutlet weak var phoneNumberCheckTextFieldDescription: UILabel!
    
    @IBOutlet weak var personalInfoButton: UIButton!
    @IBOutlet weak var termAndConditionButton: UIButton!
    @IBOutlet weak var minorCheckButton: UIButton!
    @IBOutlet weak var marketingAgreementButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for label in defaultHiddenCollection {
            label.isHidden = true
            label.textColor = .red
        }
        
        phoneNumberView.isHidden = true
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
            let idPattern = #"^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{\#(minCount),\#(maxCount)}$"#
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
        
        let idPattern = #"^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"#
        let isVaildPattern = (emailTextField.text!.range(of: idPattern, options: .regularExpression) != nil)
        
        if emailTextField.text!.isEmpty {
            emailTextFieldDescription.text = "이메일은 필수로 입력해야합니다"
        } else if isVaildPattern {
            emailTextFieldDescription.text = "조건에 맞는 이메일"
            emailTextFieldDescription.isHidden = true
        } else {
            emailTextFieldDescription.text = "올바르지 않은 이메일 형식입니다"
        }
    }
        
    @IBAction func phoneTextFieldTyped(_ sender: UITextField) {
        phoneNumberTextFieldDescription.isHidden = false
        let convertDigit = phoneNumberTextField.text!.replacingOccurrences(of: #"\D"#, with: "", options: .regularExpression)
        let count = convertDigit.count
        let rightNumberCount = [10, 11]
        switch count {
        case 0:
            phoneNumberTextFieldDescription.text = "휴대폰 번호는 필수로 입력해야합니다"
            phoneNumberTextField.text = convertDigit
        case 1...3:
            phoneNumberTextField.text = convertDigit
        case 4...7:
            phoneNumberTextField.text = convertDigit.prefix(3) + "-" + convertDigit.suffix(convertDigit.count-3)
            phoneNumberTextFieldDescription.text = "올바르지 않은 휴대폰 번호 입니다"
        case 8...11:
            let startIndex = convertDigit.index(convertDigit.startIndex, offsetBy: 3)
            let endingIndex = convertDigit.index(convertDigit.startIndex, offsetBy: count-5)
            let middleNumber = convertDigit[startIndex...endingIndex]
            phoneNumberTextField.text = convertDigit.prefix(3) + "-" + middleNumber + "-" + convertDigit.suffix(4)
            if rightNumberCount.contains(count) {
                phoneNumberTextFieldDescription.text = "올바른 휴대폰 번호입니다"
                phoneNumberTextFieldDescription.isHidden = true
            } else {
                phoneNumberTextFieldDescription.text = "올바르지 않은 휴대폰 번호입니다"
            }
        default:
            phoneNumberTextFieldDescription.text = "올바르지 않은 휴대폰 번호입니다"
        }
    }
    
    @IBAction func phoneNumberCheckTextFieldTyped(_ sender: UITextField) {
        phoneNumberCheckTextFieldDescription.isHidden = false
        let convertDigit = phoneNumberCheckTextField.text!.replacingOccurrences(of: #"\D"#, with: "", options: .regularExpression)
        phoneNumberCheckTextField.text = convertDigit
        let count = convertDigit.count
        switch count {
        case 0:
            phoneNumberCheckTextFieldDescription.text = "인증번호를 입력해주세요"
        case 6:
            phoneNumberCheckTextFieldDescription.isHidden = true
        default:
            phoneNumberCheckTextFieldDescription.text = "인증번호는 6자리 숫자 입니다."
        }
    }
    
    @IBAction func phoneNumberButtonClicked(_ sender: UIButton) {
        let rightNumberCount = [10, 11]
        let convertDigit = phoneNumberTextField.text!.replacingOccurrences(of: #"\D"#, with: "", options: .regularExpression)
        if rightNumberCount.contains(convertDigit.count) {
            phoneNumberView.isHidden = false
            phoneNumberButton.setTitle("재전송", for: .normal)
            UserDefaults.standard.set("123456", forKey: "userPassword")
        } else {
            wrongCaseAlert(title: "알림", message: "올바르지 않은 휴대폰 번호입니다")
        }
    }
    
    func wrongCaseAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let check = UIAlertAction(title: "확인", style: .destructive, handler: nil)
            alert.addAction(check)
            present(alert, animated: true, completion: nil)
        }
    
    @IBAction func phoneNumberCheckButtonClicked(_ sender: UIButton) {
        let text = phoneNumberCheckTextField.text!
        if text.count != 6  {
            wrongCaseAlert(title: "알림", message: "인증번호는 6자리 숫자입니다")
        } else if text == UserDefaults.standard.string(forKey: "userPassword") {
            phoneNumberCheckButton.setTitle("인증완료", for: .normal)
            phoneNumberCheckButton.isEnabled = false
            phoneNumberCheckTextField.isEnabled = false
        } else {
            wrongCaseAlert(title: "알림", message: "올바르지 않은 인증번호 입니다")
        }
    }
    
    @IBAction func allAgreementButtonClicked(_ sender: UIButton) {
        personalInfoButton.isSelected = true
        termAndConditionButton.isSelected = true
        minorCheckButton.isSelected = true
        marketingAgreementButton.isSelected = true
    }
    
    
}
    

