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
        
        updateUserValues()
        showPrediction()
    }
    

    func showPrediction(){
        ModelHeader.text = UserDefaults.standard.string(forKey: "usersEmail")!
        
        let recommendationModel = StageCalculator()
        
        
        do{
            //Amount ran
            let usersRecentMilesRan = defaults.string(forKey: "usersRecentMilesRan")
            //Amount Walked
            
            let usersRecentMilesWalked = defaults.string(forKey: "usersRecentMilesWalked")
            
            var totalDistance = Double(usersRecentMilesRan!)! + Double(usersRecentMilesWalked!)!
            
            var frac = Double(usersRecentMilesRan!)! / totalDistance
            
            var timeFrac = Double(0.5)
            let workoutPrediction = try recommendationModel.prediction(jog_abs_time: Double(usersRecentMilesRan!)!, jog_frac_time: timeFrac, jog_abs_dist: totalDistance, jog_frac_dist: frac)

            
            ModelHeader.text = String(workoutPrediction.stage)
            
            
            
        }
        catch{
            print("Unable to perform inference")
        }
        
    }
    
    func updateUserValues(){
       print("HI")
        
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
    func getHeartRate() -> Double? {
        var mostRecentHeartRate: Double?
        
        
        
        return mostRecentHeartRate
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 
}
