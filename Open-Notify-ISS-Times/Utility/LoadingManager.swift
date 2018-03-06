//
//  LoadingManager.swift
//  Open-Notify-ISS-Times
//
//  Created by Shaik Akbar Basha on 3/6/18.
//  Copyright © 2018 Akbar. All rights reserved.
//

import Foundation
import UIKit

class LoadingManager{
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    
    
    open class var sharedInstance: LoadingManager {
        struct Static {
            static let instance: LoadingManager = LoadingManager()
        }
        return Static.instance
    }
    
    
    
    open func showActivityIndicatory(uiView: UIView) {
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = UIColor(hex: "0xffffff", alphaValue: 0.3)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = CGPoint(x: uiView.center.x, y: uiView.center.y)
        loadingView.backgroundColor = UIColor(hex: "0x444444", alphaValue: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x:loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    
    open func hideActivityIndicator(uiView: UIView) {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    
}


extension UIColor {
    convenience init(hex: String , alphaValue: Float) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: CGFloat(alphaValue)
        )
    }
}

