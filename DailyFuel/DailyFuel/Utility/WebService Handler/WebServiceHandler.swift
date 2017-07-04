//
//  WebServiceHandler.swift
//

//MARK:- README
/*
 // I have created one generic method (apiRequest) for Api call.
 // Create individual method for each dedicated api call like I do
*/

import UIKit
import Alamofire


class WebServiceHandler: NSObject {
    
    class var sharedInstance: WebServiceHandler {
        struct Static {
            static let instance: WebServiceHandler = WebServiceHandler()
        }
        return Static.instance
    }
    
    // MARK: Common Request
    func apiPostRequest( method: Alamofire.HTTPMethod, parameters:Parameters, url: String, completion:@escaping ( _ finished: Bool, _ response: AnyObject?) ->Void) {
        
        let headers: HTTPHeaders = [
            "X-Mashape-Key": XMashapeKey,
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            if let JSON = response.result.value {
                completion(true, JSON as AnyObject?)
            } else {
                completion(false, response.result.error as AnyObject?)
            }
        }

        
        
        Alamofire.request(url, headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                completion(true, JSON as AnyObject?)
            } else {
                completion(false, response.result.error as AnyObject?)
            }
        }
     

    }
    
    
    // MARK: Fetch weather information
    func getFuelInformation(postData: NSDictionary, successBlock:@escaping ( _ result : BaseClass) -> Void,failureBlock:@escaping (_ error:NSError)->Void)
    {
        //Utility.showLoader()    //Show loader indicator. This loader indicator is created in Utility class without the use of third party
        
        self.apiPostRequest(method: .post, parameters: postData as! Parameters, url: BASE_URL) { (finished, response) in
            if(finished){
                if let dictionaryPlayout = response{
                    let weatherInformationModelObject = FuelBusinessLayer.sharedInstance.parseArrayJsonData(data: dictionaryPlayout as! Dictionary<String, Any>)
                    successBlock(weatherInformationModelObject)
                }
                //Utility.hideLoader()
            }else{
                let error = response as! NSError
                failureBlock(error)
                //Utility.hideLoader()
            }
        }
    }
    
}
