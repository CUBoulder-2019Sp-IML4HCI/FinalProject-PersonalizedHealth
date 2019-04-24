//
//  ViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/03/19.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("HI")
        
        authorize()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func authorize(){
        let healthStore = HKHealthStore()
        let healthKitTypes: Set = [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
            //access heart rate data
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            //Access walking/running
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
            //Access pace
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.walkingHeartRateAverage)!
        
        ]
        

        healthStore.requestAuthorization(toShare: nil, read: healthKitTypes){ (bool,error) in if let e = error{
                print("Something didn't work in authorization! \(e.localizedDescription)")
            }
        else{
            print("User has completed data authorization")
            }
        }
        
    
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        self.shouldPerformSegue(withIdentifier: "loginView", sender: self)
//    }


}

