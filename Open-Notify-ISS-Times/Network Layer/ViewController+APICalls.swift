
/*
 Open-Notify-ISS-Times
 
 File: iewController+APICalls.swift
 
 Version: <1.0>
 
 Copyright © 2018 Akbar. All rights reserved.
 */

import Foundation
import Alamofire

extension ViewController {
    //Api call to get the passes
    func apiCallToGetTheSetOfPasses(latitude:String,longtutude:String){
        //Show progress indicator till get the response
        LoadingManager.sharedInstance.showActivityIndicatory(uiView: self.view)
        
        if  self.passesData.count>0{
            self.passesData.removeAll()
        }
        
        let urlToGetData  = String(format: "\(baseURL)lat=%@&lon=%@",latitude,longtutude)
        //let url = URL(string: "http://api.open-notify.org/iss-pass.json?lat=65&lon=165")!
        let url = URL(string: urlToGetData)!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //print("urlRequest",urlRequest)
        
        Alamofire.request(urlRequest).responseJSON(completionHandler: { (response) in
            
            if let json = response.result.value {
                
                let jsonData = json as? NSDictionary
                //print("jsonData :",jsonData ?? "Empty")
                                
                if let dict = jsonData?["response"] as? [[String: AnyObject]]{
                    for temp in dict{
                        let passDetail = PassesModal(jsonDict: temp)
                        self.passesData.append(passDetail)
                    }
                }
                self.passesTableView.reloadData()
                //print(self.passesData.count)
                
               
            }
            else{
                //Handle Erro message when There is no response received
                //self.simpleAlertWithTitleAndMessage(("Network Issue", "Your network seems  to be offline, Please try again later."))
            }
            //Hide progress indicator till get the response
               LoadingManager.sharedInstance.hideActivityIndicator(uiView: self.view)
            
        })
    }
}
