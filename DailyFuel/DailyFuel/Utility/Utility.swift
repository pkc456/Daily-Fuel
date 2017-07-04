//
//  Utility.swift
//  Governeye
//
//  Created by pradeep.chaudhary on 6/14/17.
//  Copyright © 2017 pradeep.chaudhary. All rights reserved.
//

import Foundation
import UIKit

class Utility{

    static let KEY_USER_DETAIL = "User_detail"
    
    class var sharedInstance: Utility {
        struct Static {
            static let instance: Utility = Utility()
        }
        return Static.instance
    }
    
    /*
    //MARK:- User detail mdodel object save and retrive
    
    func saveUserDetails()
    {
        let APP_DELEGATE : AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let datos = NSKeyedArchiver.archivedData(withRootObject: APP_DELEGATE.userDetail)
        UserDefaults.standard.set(datos, forKey: Utility.KEY_USER_DETAIL)
        UserDefaults.standard.synchronize()
    }
    
    func getUserDetail() -> UserDetail?
    {
        let decoded  = UserDefaults.standard.object(forKey: Utility.KEY_USER_DETAIL) as? NSData
        var decodedObject : UserDetail?
        if(decoded != nil)
        {
            decodedObject = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as? UserDetail
            return decodedObject!
        }
        return decodedObject
    }
    */
}

//MARK:- UIView controller Extension
extension UIViewController{
    func showAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
