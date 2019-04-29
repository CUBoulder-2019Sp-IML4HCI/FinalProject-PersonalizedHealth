//
//  CurrentPlanViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/17.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit
import HealthKit

class CurrentPlanViewController: UIViewController {

//    """
//    Outlets / Labels for UI
//        ModelHeader: Current Recommendation Number
//
//    """
    @IBOutlet weak var ModelHeader: UILabel!
    
    
    @IBOutlet weak var startStopButton: UIButton!
    
    
    
    
//    """
//    Delegate Variables
//    """
    let defaults = UserDefaults.standard
    
    
    
    
    
//    """
//    Boolean Checks
//    """
    var currentWorkout = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        showPrediction()
    }
    

    func showPrediction(){
        ModelHeader.text = "Please use this page while you are starting and ending a new workout!"
        
    }
    

    @IBAction func startWorkoutButtonTapped(_ sender: Any) {
        if (self.currentWorkout){
            //finish the current workout
            self.currentWorkout = false
            self.startStopButton.setTitle("Start Workout", for: .normal)
            defaults.set("true", forKey:"userHasDoneWorkout")
            defaults.set(Date(), forKey:"finishTime")
            self.performSegue(withIdentifier: "userFeedback", sender: nil)
        }
            else{
                self.currentWorkout = true
                self.startStopButton.setTitle("End Workout", for: .normal)
                defaults.set(Date(), forKey:"startTime")
            
            }


    }
    
 
}
