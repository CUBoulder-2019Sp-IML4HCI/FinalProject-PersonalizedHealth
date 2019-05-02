//
//  feedbackViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/23.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class feedbackViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var sliderValue: UILabel!
    override func viewDidLoad() {
        
        super.viewDidLoad()

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
    
    
    
    @IBAction func adjustingSliderValue(_ sender: UISlider) {
        var currentValue = Int(sender.value)
        
        DispatchQueue.main.async {
            self.sliderValue.text = "\(currentValue)"
        }
      
        
    }


    @IBAction func submitFeedbackButton(_ sender: Any) {
        let currentValue = Int(self.sliderValue.text!)
        
        //
        //Given a user feedback, update our recommendation
        //
        var currentRec = defaults.integer(forKey: "recommendation")
        print("Current Rec is: ",currentRec)
        
        if currentValue == 4{
            if currentRec > 0{
                defaults.set(currentRec-1, forKey: "recommendation")
            }
        }
        if currentValue == 5{
            if currentRec > 1{
                defaults.set(currentRec-2, forKey: "recommendation")
            }
        }
        if currentValue == 1{
            if currentRec < 8{
                defaults.set(currentRec+1, forKey: "recommendation")
            }
        }
        if currentValue == 0{
            if currentRec < 7{
                
                defaults.set(currentRec+2, forKey: "recommendation")
                
            }
        }
        print(currentValue ?? "None")
        print("Current Rec: ",defaults.integer(forKey: "recommendation"))
   
        //Put in an alert thanking/acknowledging user for feedback.
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
