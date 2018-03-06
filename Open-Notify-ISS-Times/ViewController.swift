//
//  ViewController.swift
//  Open-Notify-ISS-Times
//
//  Created by Shaik Akbar Basha on 3/6/18.
//  Copyright © 2018 Akbar. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var passesTableView: UITableView!
    var locationManager: CLLocationManager!
    var passesData = [] as [PassesModal]
    
    var deviceLatitude:String = ""
    var deviceLongtitude:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
        //self.apiCallToGetTheSetOfPasses()
        
        determineMyCurrentLocation()
        

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 10.0;
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            //locationManager.startUpdatingHeading()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
        // manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        
        self.deviceLatitude = String(format: "%f",userLocation.coordinate.latitude)
        self.deviceLongtitude = String(format: "%f",userLocation.coordinate.longitude)
        
        self.apiCallToGetTheSetOfPasses(latitude: self.deviceLatitude, longtutude: self.deviceLongtitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}

//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        if status != .authorizedWhenInUse {return}
//
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//        let locValue: CLLocationCoordinate2D = manager.location!.coordinate
//        print("locations = \(locValue.latitude) \(locValue.longitude)")
//
//    }//locationManager func declaration

//}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return settingListItems.count
        return self.passesData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassesListIdentifier", for: indexPath) as? PassesListViewCellTableViewCell
        let shareLocDetail = self.passesData[indexPath.row]
        cell?.durationLable.text = shareLocDetail.durationInString
        cell?.timeLable.text = shareLocDetail.risetimeInString
//        if let value  = shareLocDetail.timeType_ID as? String{
//            if value.contains("Time Based") {
//                let item = shareLocDetail.timeType_ID.components(separatedBy: " ")
//                let attrs1 = [NSFontAttributeName : UIFont(name:"Avenir-Book", size:14 ), NSForegroundColorAttributeName :  UIColor(red: 45/255, green: 52/255, blue: 148/255, alpha: 1.0)]
//                let attrs2 = [NSFontAttributeName : UIFont(name:"Avenir-Book", size:12), NSForegroundColorAttributeName : UIColor.black]
//                let attributedString1 = NSMutableAttributedString(string:"Time Based", attributes:attrs1)
//                let attributedString2 = NSMutableAttributedString(string:" \(item[2]) \(item[3])", attributes:attrs2)
//                attributedString1.append(attributedString2)
//                print(item)
//                cell?.timeBasedLable.attributedText = attributedString1
//            } else {
//                cell?.timeBasedLable.text = value
//
//            }
//
//
//        }

        //let convertedTime = self.convertTheTimeToDate(value: shareLocDetail.timeInSec_ID)
        return cell!
    }

}



