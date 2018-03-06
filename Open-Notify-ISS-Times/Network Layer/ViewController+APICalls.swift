
/*
 Open-Notify-ISS-Times
 
 File: iewController+APICalls.swift
 
 Version: <1.0>
 
 Copyright © 2018 Akbar. All rights reserved.
 */

import Foundation
import Alamofire

extension ViewController {
    
    func apiCallToGetTheSetOfPasses(latitude:String,longtutude:String){
        
        if  self.passesData.count>0{
            self.passesData.removeAll()
        }
        
        let urlToGetData  = String(format: "\(baseURL)lat=%@&lon=%@",latitude,longtutude)
        //let url = URL(string: "http://api.open-notify.org/iss-pass.json?lat=65&lon=165")!
        let url = URL(string: urlToGetData)!

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //  "count": "140",
        //        let parameters:Parameters = [
        //            //"lat":StoredCoOrdinates.sharedInstance.imeiString ?? "1",
        //            "lat":"77.229467",
        //            "lon":"177.229467",
        //            ]
        //        print(parameters)//352891066265451
        
        print("urlRequest",urlRequest)
        
        //        do {
        //            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
        //        } catch {
        //
        //        }
        
        
        Alamofire.request(urlRequest).responseJSON(completionHandler: { (response) in
            
            if let json = response.result.value {
                
                let jsonData = json as? NSDictionary
                print("jsonData :",jsonData ?? "Empty")
                                
                if let dict = jsonData?["response"] as? [[String: AnyObject]]{
                    for temp in dict{
                        let passDetail = PassesModal(jsonDict: temp)
                        self.passesData.append(passDetail)
                    }
                }

                print(self.passesData.count)
                
                self.passesTableView.reloadData()
                //                if let listOfCoordinates = jsonData?.value(forKey: "GPS") as? Array<Any>{
                //
                //
                //                    for (index,coOrdinateItem) in listOfCoordinates.enumerated() {
                //                        //print(coOrdinateItem)
                //                        //print(coOrdinateItem.index(of: ))
                //                        let eachItemArray = coOrdinateItem as? Array<Any>
                //                        print(eachItemArray ?? "Array is Nil")
                //
                //                        //let arr = eachItemArray.characters.split(separator: " ").map(String.init)
                //
                //                        let latitudeString  = eachItemArray![0]
                //                        let longtitudeString  = eachItemArray![1]
                //
                //                        print(latitudeString,longtitudeString)
                //
                //                        let geoCoordinates = NMAGeoCoordinates.init(latitude: latitudeString as! Double, longitude: longtitudeString as! Double)
                //
                //                        self.listOfGeoCoordinatesAfterDelay.append(geoCoordinates)
                //
                //                    }
                //
                //                    print(self.listOfGeoCoordinatesAfterDelay)
                //
                //                }
                
                
            }
            else{
                //self.showCarImageAtStaticLocation()
                //self.simpleAlertWithTitleAndMessage(("Network Issue", "Your network seems  to be offline, Please try again later."))
            }
            //  LoadingIndicatorView.hide()
            //   LoadingManager.sharedInstance.hideActivityIndicator(uiView: self.view)
            
        })
    }
}
