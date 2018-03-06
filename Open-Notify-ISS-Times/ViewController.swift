
/*
 Open-Notify-ISS-Times
 
 File: ViewController.swift
 
 Version: <1.0>
 
 Copyright © 2018 Akbar. All rights reserved.
 */

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    let cellReuseIdentifier = "PassesListIdentifier"
    @IBOutlet var passesTableView: UITableView!
    var locationManager: CLLocationManager!
    var passesData = [] as [PassesModal]
    
    var deviceLatitude:String = ""
    var deviceLongtitude:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
        // Do any additional setup after loading the view, typically from a nib.
        //Method to get the device current location.
        determineMyCurrentLocation()
        
        //registering the PassesListViewCellTableViewCell
        self.passesTableView.register(UINib(nibName: "PassesListViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: cellReuseIdentifier)
        //Set the passesTableView delegates and Data sources.
        self.passesTableView.delegate = self
        self.passesTableView.dataSource = self

        
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
    //didUpdateLocations when user allows the app to update the location.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        
         manager.stopUpdatingLocation()
        
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        //didUpdateLocations is getting called many times,To update UI only once this logic is added.
        if(self.deviceLatitude == ""){
            self.deviceLatitude = String(format: "%f",userLocation.coordinate.latitude)
            self.deviceLongtitude = String(format: "%f",userLocation.coordinate.longitude)
            
            self.apiCallToGetTheSetOfPasses(latitude: self.deviceLatitude, longtutude: self.deviceLongtitude)
        }
    }
    //Handle when Error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}
//Extension to handle UITableView Delegate and Data Source
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return settingListItems.count
        return self.passesData.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Reuse PassesListViewCellTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "PassesListIdentifier", for: indexPath) as? PassesListViewCellTableViewCell
        let shareLocDetail = self.passesData[indexPath.row]
        cell?.durationLable.text = shareLocDetail.durationInString
        cell?.timeLable.text = shareLocDetail.risetimeInString
        return cell!
    }

}



