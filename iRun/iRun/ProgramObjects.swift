//
//  ProgramObjects.swift
//  iRun
//
//  Created by Robert Renecker on 2019/04/23.
//  Copyright © 2019 ML HCI. All rights reserved.
//

import Foundation
import UIKit

class ProgramObject: NSObject{
    var from: String?
    var to: String?
    
    func initWithData( from: String, to:String){
        self.from = "10"
        self.to = "12"
    }
}
