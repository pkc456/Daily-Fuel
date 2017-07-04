//
//  FuelBusinessLayer.swift
//  DailyFuel
//
//  Created by pradeep.chaudhary on 6/30/17.
//  Copyright © 2017 pradeep.chaudhary. All rights reserved.
//

import UIKit

class FuelBusinessLayer: NSObject {

    class var sharedInstance: FuelBusinessLayer {
        struct Static {
            static let instance: FuelBusinessLayer = FuelBusinessLayer()
        }
        return Static.instance
    }
    
    func parseArrayJsonData(data: Dictionary<String, Any>) -> (BaseClass) {
        let modelObject: BaseClass = BaseClass(object: data)
//        let modelObject: BaseClass = BaseClass(json: data)!
        return modelObject
    }
}
