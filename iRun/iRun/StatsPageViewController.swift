//
//  StatsPageViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/03.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class StatsPageViewController: UIViewController {

    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var recentMilesRan: UILabel!
    
    @IBOutlet weak var recentMilesWalked: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentData()
        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func presentData(){
        if hasUserData() == "true" {
            let usersName =  defaults.string(forKey: "usersName")
            let usersAge =  defaults.string(forKey: "usersAge")
            
            let usersHeight = defaults.string(forKey: "usersHeight")
            
            let usersWeight = defaults.string(forKey: "usersWeight")
            
            let usersRecentMilesRan = defaults.string(forKey: "usersRecentMilesRan")
            
            let usersRecentMilesWalked = defaults.string(forKey: "usersRecentMilesWalked")
            
            
            
            name.text = "Welcome " + usersName!
            age.text = "Age: " + usersAge!
            weight.text = "Weight: " + usersWeight! + "lbs"
            height.text = "Height: " + usersHeight! + "cm"
            
            
           
            
            
            recentMilesRan.text = "You've ran: " + usersRecentMilesRan! + " miles in the last month!"
            
            recentMilesWalked.text = "You've Walked: " + usersRecentMilesWalked! + " miles in the last month!"
            
          
            
        }   else{
            print("No data avaialable")
            name.text = "Welcome "
            
            
            weight.text = "Weight: "
            
            height.text = "Height: "
            
            recentMilesRan.text = "You've ran: " + "0 miles in the last week!"
            
            age.text = "Age: "
            
            recentMilesWalked.text = "You've walked: " + " 0 miles in the last week!"
            
        }
        
        
    }
    
    
    func hasUserData() -> String{
        if let isLogged = defaults.string(forKey: "userHasData"){
          
            return isLogged
        }
        else {
            return "false"
        }
       
    }
}
