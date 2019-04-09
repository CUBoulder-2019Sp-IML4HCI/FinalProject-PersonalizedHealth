//
//  Tab1ViewController.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/07.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let testLabels = ["test1", "test2", "test3"]
    let testImages = [#imageLiteral(resourceName: "1"), #imageLiteral(resourceName: "2"), #imageLiteral(resourceName: "3")]

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

}
//extension Tab1ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return testLabels.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        cell.cellImage.image = testImages[indexPath.row]
//        cell.cellLabel.text = testLabels[indexPath.row]
//        return cell
//    }
//
//
//}
