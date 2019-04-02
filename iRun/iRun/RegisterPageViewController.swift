//
//  RegisterPageViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/02.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit


class RegisterPageViewController: UIViewController{

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    //On submit, check if all data is valid and if passwords match.
    //Write data and confirm user.
    @IBAction func registerButtonTapped(_ sender: Any) {
    
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || repeatPasswordTextField.text!.isEmpty {
            displayLoginAlert(myMessage:"One of the required fields is missing")
            return
        }
        else{
            let userEmail = emailTextField.text
            let userPassword = passwordTextField.text
            let repeatPassword = repeatPasswordTextField.text
            
            if( userPassword != repeatPassword){
                displayLoginAlert(myMessage:"Passwords do not match")
                return
            }
            
 
        }
        
        
        /*
            Save / Store the data
             - For now save locally
            Display alert acknowledging data saved.
            More...
        */
        
        
        
    }
    
    func displayLoginAlert(myMessage: String){
        var alert = UIAlertController(title:"loginAlert", message: myMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "action", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
}
