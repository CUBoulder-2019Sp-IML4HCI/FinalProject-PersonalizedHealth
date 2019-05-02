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
    
    let recommendationModel = runningRecommendation()
    
    let healthStore = HKHealthStore()
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var recentDistance: UILabel!
    
    
    @IBOutlet weak var recentPace: UILabel!
    

    
    @IBOutlet weak var curRecommendationHeader: UILabel!
    
    @IBOutlet weak var curRecommendationImage: UIImageView!
    
    var tempHR = 0.0
    var recImages: [UIImage] = []

    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recImages.append(UIImage(named: "rec1.png")!)
        recImages.append(UIImage(named: "rec2.png")!)
        recImages.append(UIImage(named: "rec3.png")!)
        recImages.append(UIImage(named: "rec4.png")!)
        recImages.append(UIImage(named: "rec5.png")!)
        recImages.append(UIImage(named: "rec6.png")!)
        recImages.append(UIImage(named: "rec7.png")!)
        recImages.append(UIImage(named: "rec8.png")!)
        recImages.append(UIImage(named: "rec9.png")!)
        presentData()
        // Do any additional setup after loading the view.
        // 1. Show tables for current recommendation
        // 2. Recommendation submit function
        
        
        
        
    }
    

    
    func presentData(){
        if hasUserData() == "true" {
            let usersName =  defaults.string(forKey: "usersName")
            
            
            
            name.text = "Welcome " + usersName!
            recentDistance.text = "You went a total of " + String(defaults.double(forKey: "recentDistance")) + " km last workout!"
            var curRec = defaults.integer(forKey: "recommendation")
            
            curRecommendationHeader.text = "Workout " + String(curRec)
            curRecommendationImage.image = recImages[curRec]
            
            
          
            
        }   else{
            
            name.text = "Please register your information "
            
        }
        
        
    }
    
    
    
    
    
    
    
    @IBAction func getRecommendation(_ sender: Any) {
        var tempDistance = ""
        
        //Get Times of last workout
        if hasDoneOneWorkout() == "true" {
            
            //HeartRate
            getLastHeartRate{ (result) in
                DispatchQueue.main.async{
        
                    print("Last workout's average heartrate was: " + String(result))
                    
                }
            }
            
            //Distance
            getLastWorkoutDistance{ (result) in
                DispatchQueue.main.async{
                    self.recentDistance.text = "You went a total of " + String(result) + " km last workout!"
                    self.defaults.set(result, forKey: "recentDistance")
                }
            }
            
            
            
            //Get the recommendation via our model
            do{
                //Get total time of last workout in minutes
                let startTime = defaults.object(forKey:"startTime") as! Date
                let finishTime = defaults.object(forKey:"finishTime") as! Date
                let distanceBetweenDates: TimeInterval? = finishTime.timeIntervalSince(startTime)
                let minutesInAnHour: Double = 60
                
                
                let minutesBetweenDates = distanceBetweenDates! / minutesInAnHour
                
                //Get pace
                var recentDistanceDouble = defaults.double(forKey: "recentDistance")
                recentDistanceDouble *= 1.60934
                
                var pace = minutesBetweenDates / recentDistanceDouble
//                if Int(pace) > 45{
//                    pace = 45
//                }
                recentPace.text = "You're recent pace for the last workout was: " + String(pace) + " minutes per mile."
              
                //Get prediction
                
                
                let prediction = try recommendationModel.prediction(pace: pace,distance: recentDistanceDouble)
                let integerPrediction = prediction.rec
                
                //Set defaults (persisted) recommendation to the new predictin
                defaults.set(integerPrediction, forKey: "recommendation")
                print(integerPrediction)
                
                
                
            }
            catch{
                print("Unable to perform inference")
            }
                
                
            }
        else{
            print("please do at least one workout before we can give you a recommendation")
        }
        
        
    }
    
//    func populateRecommendationTable() -> Recommendation {
//
//    }
    
    
    
    
    
    
    //Helper/Service functions for getting health data.
    
    func getLastHeartRate(completion: @escaping (Double) -> Void){
        let startTime = defaults.object(forKey:"startTime") as! Date
        //let startTime = Calendar.current.startOfDay(for: Date())
        let finishTime = defaults.object(forKey:"finishTime") as! Date
  
        let predicate = HKQuery.predicateForSamples(withStart: startTime, end: finishTime)
        
    
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        
        let querySteps = HKStatisticsQuery(quantityType: heartRateType, quantitySamplePredicate: predicate, options: .discreteAverage){
            
            (_, result, error) in
            var resultCount = 0.0
            
            guard let result = result else{
                print("failed to fetch heart rate")
                completion(resultCount)
                return
            }
            var quantity: HKQuantity? = result.averageQuantity()
            var beats: Double? = quantity?.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute()))
            
            
       
            DispatchQueue.main.async {
                completion(beats!)
            }
            }
            
        healthStore.execute(querySteps)
        }
    
    
    func getLastWorkoutSteps(completion: @escaping (Double) -> Void){
        let startTime = defaults.object(forKey:"startTime") as! Date
        //let startTime = Calendar.current.startOfDay(for: Date())
        let finishTime = defaults.object(forKey:"finishTime") as! Date
  
        let predicate = HKQuery.predicateForSamples(withStart: startTime, end: finishTime)
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
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
    
    
    func getLastWorkoutDistance(completion: @escaping (Double) -> Void){
        let startTime = defaults.object(forKey:"startTime") as! Date
        //let startTime = Calendar.current.startOfDay(for: Date())
        let finishTime = defaults.object(forKey:"finishTime") as! Date
        let predicate = HKQuery.predicateForSamples(withStart: startTime, end: finishTime)
        

        let walkRunType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
     
        
        let querySteps = HKStatisticsQuery(quantityType: walkRunType, quantitySamplePredicate: predicate, options: .cumulativeSum){
            
            (_, result, error) in
            var resultCount = 0.0
            
            guard let result = result else{
                print("failed to fetch steps")
                completion(resultCount)
                return
            }
            
            if let sum = result.sumQuantity() {
                resultCount = sum.doubleValue(for: HKUnit.mile())
            }
            
            DispatchQueue.main.async {
                completion(resultCount)
            }
        }
        healthStore.execute(querySteps)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Helper Functions for boolean checking
    
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
