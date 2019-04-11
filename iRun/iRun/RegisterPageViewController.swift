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

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var Age: UITextField!
    
 
    @IBOutlet weak var Height: UITextField!
    

    @IBOutlet weak var Weight: UITextField!
    
  
    @IBOutlet weak var MilesRanLastWeek: UITextField!
    
    @IBOutlet weak var MilesWalkedLastWeek: UITextField!
    
    
    @IBOutlet weak var Other: UITextField!
    
    
    
    override func viewDidLoad(){
   
        super.viewDidLoad()
    }
    
    
    
    //On submit, check if all data is valid and if passwords match.
    //Write data and confirm user.
    @IBAction func registerButtonTapped(_ sender: Any) {
    
        if name.text!.isEmpty || Age.text!.isEmpty || Height.text!.isEmpty || Weight.text!.isEmpty || MilesRanLastWeek.text!.isEmpty || MilesWalkedLastWeek.text!.isEmpty || Other.text!.isEmpty {
            displayLoginAlert(myMessage:"One of the required fields is missing")
            return
        }
       
        let usersName = name.text
        let usersAge = Int(Age.text!)
       
        let usersWeight = Int(Weight.text!)
        let usersHeight = Int(Height.text!)
        let usersRecentMilesRan = Int(MilesRanLastWeek.text!)
        let usersRecentMilesWalked = Int(MilesRanLastWeek.text!)
        
        
       
        
    
            
 
        
    
        /*
            Save / Store the data
             - For now save locally
        */
        
        defaults.set(usersName, forKey:"usersName")
        defaults.set(usersAge, forKey:"usersAge")
        defaults.set(usersWeight, forKey:"usersWeight")
        defaults.set(usersHeight, forKey:"usersHeight")
        defaults.set(usersRecentMilesRan, forKey:"usersRecentMilesRan")
        defaults.set(usersRecentMilesWalked, forKey:"usersRecentMilesWalked")
      
        
        //defaults.set("true", forKey:"userHasData")
        
        

        
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
