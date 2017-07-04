//
//  ViewController.swift
//  DailyFuel
//
//  Created by pradeep.chaudhary on 6/30/17.
//  Copyright © 2017 pradeep.chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let dic = ["fuel" : "p", "state" : "dl"]
        
        WebServiceHandler.sharedInstance.getFuelInformation(postData: dic as NSDictionary, successBlock: { (data) in
            print(data)
        }) { (error) in
            print(error)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

