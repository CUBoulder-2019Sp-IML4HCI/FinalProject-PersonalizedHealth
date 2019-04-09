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
