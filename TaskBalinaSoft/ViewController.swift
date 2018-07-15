//
//  ViewController.swift
//  TaskBalinaSoft
//
//  Created by Sasha Dubikovskaya on 05.07.2018.
//  Copyright © 2018 TaskBalinaSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstBoundView: UIView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondBoundView: UIView!
    @IBOutlet weak var forRegistrationButton: UIButton!
    @IBAction func registrationButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        forRegistrationButton.layer.cornerRadius = 5
        forRegistrationButton.layer.masksToBounds = true
        forRegistrationButton.setGradientBackground(colorOne: Colors.greenblue, colorTwo: Colors.turquoise)
        
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

