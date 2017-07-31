//
//  CustomLoader.swift
//  r3pi
//
//  Created by Nazar on 31/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import UIKit

class CustomLoader: UIView {

    static let sharedInstance = CustomLoader()
    static let progressLoader:UIActivityIndicatorView = UIActivityIndicatorView()
    static let overlay = UIView()
    
    func showLoader(parent:UIView)
    {
        CustomLoader.overlay.frame = parent.frame
        CustomLoader.overlay.backgroundColor = UIColor.black
        CustomLoader.overlay.alpha = 0.8
        
        CustomLoader.progressLoader.center = parent.center
        CustomLoader.progressLoader.hidesWhenStopped = true
        CustomLoader.progressLoader.activityIndicatorViewStyle = .whiteLarge
        CustomLoader.overlay.addSubview(CustomLoader.progressLoader)
        parent.addSubview(CustomLoader.overlay)
        
        CustomLoader.progressLoader.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func hideLoader()
    {
        CustomLoader.overlay.removeFromSuperview()
        CustomLoader.progressLoader.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }

}
