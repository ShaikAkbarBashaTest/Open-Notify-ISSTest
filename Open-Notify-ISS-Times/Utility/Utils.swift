
/*
 Open-Notify-ISS-Times
 
 File: Utils
 
 Version: <1.0>
 
 Copyright © 2018 Akbar. All rights reserved.
 */

import Foundation

//Dev environment
let baseURL = "http://api.open-notify.org/iss-pass.json?"


class Utils {
    //Create Shared instance
    open class var sharedInstance: Utils {
        struct Static {
            static let instance: Utils = Utils()
        }
        return Static.instance
    }
 //convert the rise time into Readable time stampe means in days..hours and minutes
    func stringFromTimeInterval(value : Int64) -> String {
        
        let days = value / 86400;
        let abovedays = value % 86400;
        let hour = abovedays / 3600;
        let abovehours = abovedays % 3600;
        let minutes = abovehours / 60;
        //let seconds = abovehours % 60;
        
        var result = " "
        
        if days != 0 {
            result = result + String(format: " %d days ",days)
        }
        
        if hour != 0 {
            result = result + String(format: "%d hrs ",hour)
        }
        
        if minutes != 0 {
            result = result + String(format: "%d mins ",minutes)
        }
        //To handle Seconds
//        if seconds != 0 {
//            result = result + String(format: "%d secs",seconds)
//        }
        
        result = result + String(format: "ago")
        
        return result
    }
    
}
