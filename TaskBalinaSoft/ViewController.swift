//
//  ViewController.swift
//  TaskBalinaSoft
//
//  Created by Sasha Dubikovskaya on 05.07.2018.
//  Copyright © 2018 TaskBalinaSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var email = "jobs@balinasoft.com"
    var password = "1111"
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstBoundView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondBoundView: UIView!
    @IBOutlet weak var forRegistrationButton: UIButton!
    @IBAction func registrationButton(_ sender: UIButton) {
        
        messageLabel.isHidden = true
        
        guard var _ = emailTextField,
            emailTextField.text?.count != 0 else {
            messageLabel.isHidden = false
            messageLabel.text = "Please enter your email."
            return
        }
        
        if isValidEmail(emailID: emailTextField.text!) == false {
            messageLabel.isHidden = false
            messageLabel.text = "Please enter valid email address."
        }
        
        guard var _ = passwordTextField,
            passwordTextField.text?.count != 0 else {
            messageLabel.isHidden = false
            messageLabel.text = "Please enter your password."
            return
        }
        
        if isValidPassword(password: passwordTextField.text!) == false {
            messageLabel.isHidden = false
            messageLabel.text = "Please enter valid password."
        }
        
        if (passwordTextField.text?.count)! < 3 {
            messageLabel.isHidden = false
            messageLabel.text = "Password is too short. Please enter longer password."
        }
        
        if (passwordTextField.text?.count)! > 10 {
            messageLabel.isHidden = false
            messageLabel.text = "Password is too long. Please enter shorter password."
        }
        
        if email == emailTextField.text && password == passwordTextField.text && password.count <= 10 && password.count >= 3 {
            messageLabel.isHidden = false
            messageLabel.text = "Wellcome!"
        }
    }
    
    func isValidEmail(emailID: String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: emailID)
    }
    
    func isValidPassword(password: String) -> Bool{
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        
        return passwordTest.evaluate(with: password)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        forRegistrationButton.layer.cornerRadius = 5
        forRegistrationButton.layer.masksToBounds = true
        forRegistrationButton.setGradientBackground(colorOne: Colors.greenblue, colorTwo: Colors.turquoise)
        
        messageLabel.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func keyboardShow(notification: Notification) {
       
        view.frame.origin.y = -135
    }
}
