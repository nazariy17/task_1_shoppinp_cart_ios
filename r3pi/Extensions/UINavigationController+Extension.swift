//
//  UINavigationController+Extension.swift
//  r3pi
//
//  Created by Nazar on 31/07/2017.
//  Copyright © 2017 Nazariy Bohun. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController
{
    func customSetup()
    {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title:"Back", style:.plain, target:nil, action:nil)
        navigationBar.barStyle = .blackOpaque
        navigationBar.tintColor = UIColor.white
        view.backgroundColor = UIColor.black
    }
}
