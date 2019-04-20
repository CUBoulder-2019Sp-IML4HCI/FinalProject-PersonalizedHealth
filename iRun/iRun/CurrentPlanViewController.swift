//
//  CurrentPlanViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/17.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class CurrentPlanViewController: UIViewController {
    
    @IBOutlet weak var ModelHeader: UILabel!
    
    let defaults = UserDefaults.standard
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
