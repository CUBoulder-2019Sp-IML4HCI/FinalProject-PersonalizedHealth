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
        
        
        temp1.text = "Welcome " + usersEmail!
        
        
    }
}
