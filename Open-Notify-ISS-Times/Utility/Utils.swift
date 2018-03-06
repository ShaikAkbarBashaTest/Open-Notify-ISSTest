
import Foundation

//Dev environment
let baseURL = "http://api.open-notify.org/iss-pass.json?"


class Utils {
    
    open class var sharedInstance: Utils {
        struct Static {
            static let instance: Utils = Utils()
        }
        return Static.instance
    }
    
   
    
    
    
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
        
//        if seconds != 0 {
//            result = result + String(format: "%d secs",seconds)
//        }
        
        result = result + String(format: "ago")
        
        //return String(format: "updated: %0.2d days %0.2d hours %0.2d mins %0.2d secs ago",days,hours,minutes,seconds)
        return result
    }
    
}
