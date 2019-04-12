//
//  TabOneRecentViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/09.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class TabOneRecentViewController: UIViewController {


    @IBOutlet weak var SummaryHeader: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showGraph()
        
        // Do any additional setup after loading the view.
    }
    

    func showGraph(){
        SummaryHeader.text = UserDefaults.standard.string(forKey: "usersEmail")!
        let model = SleepCalculator()
        
        let wakeUp = Double(120)
        do{
        let prediction = try model.prediction(coffee: 4, estimatedSleep: 8, wake: wakeUp)
            
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        SummaryHeader.text = String(prediction.actualSleep)
     
        
        
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
