//
//  Passes.swift
//  Open-Notify-ISS-Times
//
//  Created by Shaik Akbar Basha on 3/6/18.
//  Copyright © 2018 Akbar. All rights reserved.
//

import Foundation
typealias JSONDict = [String:AnyObject]

struct PassesModal {
    
    let duration:Int64
    let risetime:Int64
    let durationInString:String
    let risetimeInString:String

    init(jsonDict: JSONDict) {
        //      trip_details_ID = jsonDict["TRIP_DETAILS_ID"] as! Int
        duration = jsonDict["duration"] as! Int64
        durationInString = String(format: "%lld", duration)
        risetime = jsonDict["risetime"] as! Int64
        let timeInReadableFormat = Utils.sharedInstance.stringFromTimeInterval(value: risetime)
        //let timeVal = self.convertTheTimeToDate(value: timeInSec_ID)
        risetimeInString = timeInReadableFormat
        //urlString = jsonDict["url"] as! String

    }
    
}
