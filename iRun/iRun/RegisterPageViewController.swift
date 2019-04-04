//
//  RegisterPageViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/02.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController{
    let defaults = UserDefaults.standard

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var userWeight: UITextField!
    
    @IBOutlet weak var userHeight: UITextField!
    
    @IBOutlet weak var userMileRanLastMonth: UITextField!
    
    @IBOutlet weak var userAge: UITextField!
    
    
    override func viewDidLoad(){
   
        super.viewDidLoad()
    }
    
    
    
    //On submit, check if all data is valid and if passwords match.
    //Write data and confirm user.
    @IBAction func registerButtonTapped(_ sender: Any) {
    
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || repeatPasswordTextField.text!.isEmpty || userWeight.text!.isEmpty || userHeight.text!.isEmpty || userMileRanLastMonth.text!.isEmpty || userAge.text!.isEmpty {
            displayLoginAlert(myMessage:"One of the required fields is missing")
            return
        }
       
        let usersEmail = emailTextField.text
        let usersPassword = passwordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        let usersWeight = Int(userWeight.text!)
        let usersHeight = Int(userHeight.text!)
        let usersRecentMiles = Int(userMileRanLastMonth.text!)
        let usersAge = Int(userAge.text!)
        
        
        
        if( usersPassword != repeatPassword){
            displayLoginAlert(myMessage:"Passwords do not match")
            return
        }
            
 
        
    
        /*
            Save / Store the data
             - For now save locally
        */
        
        defaults.set(usersEmail, forKey:"usersEmail")
        defaults.set(usersPassword, forKey:"usersPassword")
        defaults.set(usersWeight, forKey:"usersWeight")
        defaults.set(usersHeight, forKey:"usersHeight")
        defaults.set(usersRecentMiles, forKey:"usersRecentMiles")
        defaults.set(usersAge, forKey:"usersAge")
        
        
        if let name = defaults.string(forKey: "userEmail") {
            print(name)
        }

        //defaults.removeObject(forKey: "usersEmail")
//        defaults.removeObject(forKey: "usersPassword")
//        defaults.removeObject(forKey: "usersWeight")
//        defaults.removeObject(forKey: "usersHeight")
//        defaults.removeObject(forKey: "usersRecentMiles")
//        defaults.removeObject(forKey: "usersAge")
        

        
        completeRegistrationAlert(myMessage: "Regitration Successful!")
        
        
        
        
        
        
    }
    
    
    //Dynamic function to take a string and use it as the alert message. 
    func displayLoginAlert(myMessage: String){
        var alert = UIAlertController(title:"loginAlert", message: myMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "action", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func completeRegistrationAlert(myMessage:String){
        var alert = UIAlertController(title:"loginAlert", message: myMessage, preferredStyle: UIAlertController.Style.alert)
        
        let finalizeAction = UIAlertAction(title:"Ok", style: UIAlertAction.Style.default){
            action in
            self.dismiss(animated:true, completion: nil)
        }
        
        alert.addAction(finalizeAction)
        
        self.present(alert, animated: true, completion: nil)
        
        
        
        
    }
    
}
