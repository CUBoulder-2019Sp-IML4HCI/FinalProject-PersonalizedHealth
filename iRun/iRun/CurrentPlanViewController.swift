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
        //let model = SleepCalculator()
        
        //let wakeUp = Double(120)
        
        
        do{
            let workoutPrediction = try recommendationModel.prediction(jog_abs_time: 20.0, jog_frac_time: 0.6, jog_abs_dist: 3.95, jog_frac_dist: 0.7)
//            let prediction = try model.prediction(coffee: 4, estimatedSleep: 8, wake: wakeUp)
//
//            let formatter = DateFormatter()
//            formatter.timeStyle = .short

            
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
