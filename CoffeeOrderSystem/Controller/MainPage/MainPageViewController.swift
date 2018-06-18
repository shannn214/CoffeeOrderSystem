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

//    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var orderContainer: UIView!
    
    var topViewIndex: IndexPath?
    
    var mainTableVC: MainTableViewController?
    
    var mainTopVC: MainTopViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainTableVC = segue.destination as? MainTableViewController {
            self.mainTableVC = mainTableVC
        } else if let mainTopVC = segue.destination as? MainTopViewController {
            self.mainTopVC = mainTopVC
            self.mainTopVC?.topViewDelegate = self
        }
    }

}

extension MainPageViewController: TopViewDelegate {
    
    func sendTopViewData(_ controller: MainTopViewController, selectedItem: Items?) {
//        self.topViewIndex = index
//        mainTableVC?.selectedIndex = index
        mainTableVC?.selectedItem.append(selectedItem!)
        mainTableVC?.mainTableView.reloadData()

    }
    
}
