//
//  TabBarViewController.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import UIKit

enum TabBar {
    
    case main
    
    case list
    
    func controller() -> UIViewController {
        
        switch self {
        case .main:
            
            return UIStoryboard.mainStoryboatd().instantiateInitialViewController()!
            
        case .list:
            
            return UIStoryboard.listStoryboatd().instantiateInitialViewController()!
        
        }
        
    }
    
    func image() -> UIImage {
        
        switch self {
            
        case .main:
            
            return #imageLiteral(resourceName: "cart")
        
        case .list:
            
            return #imageLiteral(resourceName: "list")
            
        }
        
    }
    
    func selected() -> UIImage {
        
        switch self {
            
        case .main:
            
            return #imageLiteral(resourceName: "cart").withRenderingMode(.alwaysOriginal)
            
        case .list:
            
            return #imageLiteral(resourceName: "list").withRenderingMode(.alwaysOriginal)
            
        }
        
    }
    
}

class TabBarViewController: UITabBarController {

    let tabs: [TabBar] = [.main, .list]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        tabBar.tintColor = UIColor.black
        
        var controllers: [UIViewController] = []
        
        for tab in tabs {
            
            let controller = tab.controller()
            
            let item = UITabBarItem(title: nil,
                                    image: tab.image(),
                                    selectedImage: tab.selected())
            
            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
            
            controller.tabBarItem = item
            
            controllers.append(controller)
            
        }
        
        setViewControllers(controllers, animated: false)
        
    }

}
