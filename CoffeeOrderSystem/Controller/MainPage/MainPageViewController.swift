//
//  MainPageViewController.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import UIKit
import SDWebImage

class MainPageViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    
    var item = LoadItems()
    
    var itemData = [Items]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        item.delegate = self

        item.loadItemData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        loadImage()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadImage() {
        
//        topView.imageOne.sd_setImage(with: URL(string: itemData[0].image))
        
    }


}

extension MainPageViewController: itemsManager {
    
    func manager(_ manager: LoadItems, items: [Items]) {
        
        self.itemData += items
        
    }
    
}
