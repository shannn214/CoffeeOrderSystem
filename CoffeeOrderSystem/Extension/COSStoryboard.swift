//
//  COSStoryboard.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func mainStoryboatd() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    static func listStoryboatd() -> UIStoryboard {
        return UIStoryboard(name: "OrderList", bundle: nil)
    }
    
    static func tabBarStoryboatd() -> UIStoryboard {
        return UIStoryboard(name: "TabBar", bundle: nil)
    }

}
