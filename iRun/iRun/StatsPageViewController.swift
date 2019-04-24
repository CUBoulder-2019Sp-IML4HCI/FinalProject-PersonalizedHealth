//
//  StatsPageViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/03.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit
import HealthKit

class StatsPageViewController: UIViewController {
    let healthStore = HKHealthStore()
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var recentMilesRan: UILabel!
    
    @IBOutlet weak var recentMilesWalked: UILabel!
    
    
    var tempVal = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentData()
        // Do any additional setup after loading the view.
        // 1. Show tables for current recommendation
        // 2. Recommendation submit function
        
    }
    

    
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
            
            recentMilesWalked.text = "You've Walked: " + String(tempVal) + " steps in your last workout!"
            
          
            
        }   else{
            
            name.text = "Please register your information "
            
        }
        
        
    }
    
    
    
    
    
    
    
    @IBAction func getRecommendation(_ sender: Any) {
        
        //Get Times of last workout
        if hasDoneOneWorkout() == "true" {
            
            getLastWorkoutSteps{ (result) in
                DispatchQueue.main.async{
                    self.tempVal = result
                    self.recentMilesWalked.text = "You've Walked: " + String(self.tempVal) + " steps in your last workout!"
                }
            }
                
                
                
            }
        else{
            print("please do at least one workout before we can give you a recommendation")
        }
        
        
    }
    
    func getLastWorkoutSteps(completion: @escaping (Double) -> Void){
        let startTime = defaults.object(forKey:"startTime") as! Date
        //let startTime = Calendar.current.startOfDay(for: Date())
        let finishTime = defaults.object(forKey:"finishTime") as! Date
        print(startTime)
        print(finishTime)
        let predicate = HKQuery.predicateForSamples(withStart: startTime, end: finishTime)
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let walkRunType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)
        
        let querySteps = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum){
            
            (_, result, error) in
            var resultCount = 0.0
            
            guard let result = result else{
                print("failed to fetch steps")
                completion(resultCount)
                return
            }
            
            if let sum = result.sumQuantity() {
                resultCount = sum.doubleValue(for: HKUnit.count())
            }
            
            DispatchQueue.main.async {
                completion(resultCount)
            }
        }
        healthStore.execute(querySteps)
    }
    
    
    
    
    func hasDoneOneWorkout() -> String{
        if let hasDoneWorkout = defaults.string(forKey: "userHasDoneWorkout"){
            return hasDoneWorkout
        }
        else{
            return "false"
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
