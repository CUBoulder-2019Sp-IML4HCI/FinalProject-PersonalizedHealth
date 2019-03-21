//
//  InterfaceController.swift
//  iRun WatchKit Extension
//
//  Created by Robert Renecker on 2019/03/19.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import WatchKit
import Foundation
import HealthKit

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    @IBOutlet weak var unavailable: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        
     
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        super.willActivate()
        handleHealthKit()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func handleHealthKit(){
     
       
        if HKHealthStore.isHealthDataAvailable() {
            
            let healthStore = HKHealthStore()
            let heartRateQuantityType = HKObjectType.quantityType(forIdentifier: .heartRate)!
            let allTypes = Set([HKObjectType.workoutType(),
                                heartRateQuantityType
                ])
        
            healthStore.requestAuthorization(toShare: nil, read: allTypes) { (success, error) -> Void in
                if success == false {
                    print("Error")
                }
                self.unavailable.setText("Heart Rate: 62")
                
        }
            
        }
        else{
            self.unavailable.setText("No Data Available")
        }
        
        
    }

    
    

}
