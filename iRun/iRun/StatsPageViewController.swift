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
    
    @IBOutlet weak var temp1: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var recentMiles: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    
    
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
        let usersEmail = defaults.string(forKey: "usersEmail")
        let usersPassword = defaults.string(forKey: "usersPassword")
        
        let usersWeight = defaults.string(forKey: "usersWeight")
        
        let usersHeight = defaults.string(forKey: "usersHeight")
        
        let usersRecentMiles = defaults.string(forKey: "usersRecentMiles")
        
        let usersAge = defaults.string(forKey: "usersAge")
        
        
        temp1.text = "Welcome " + usersEmail!
        
        
        weight.text = "Weight: " + usersWeight! + "lbs"
        
        height.text = "Height: " + usersHeight! + "cm"
        
        recentMiles.text = "You've ran: " + usersRecentMiles! + " miles in the last month!"
        
        age.text = "Age: " + usersAge!
        
        
    }
}
