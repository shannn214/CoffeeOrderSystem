//
//  OrderListTableViewController.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import UIKit

class OrderListTableViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var listData = [List]()
    
    var listManager = LoadList()
    
    var item = LoadItems()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        
        setupTableView()
        
        item.loadItemData()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        
        let nib = UINib(nibName: String(describing: OrderListTableViewCell.self), bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: String(describing: OrderListTableViewCell.self))
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 180
        
    }
    
    func setupDelegate() {
        
        listManager.delegate = self
        listManager.loadData()
        
    }
    
   

}

extension OrderListTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let listCell = listTableView.dequeueReusableCell(withIdentifier: String(describing: OrderListTableViewCell.self),
                                                                for: indexPath) as? OrderListTableViewCell else { return UITableViewCell() }
        
        if (indexPath.row % 2 == 0) {
            listCell.contentView.backgroundColor = UIColor(displayP3Red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        } else {
            listCell.contentView.backgroundColor = UIColor.white
        }
        
        listCell.numberLabel.text = listData[indexPath.row].number
        listCell.accountLabel.text = listData[indexPath.row].account
        listCell.timeLabel.text = String(describing: "\(listData[indexPath.row].time)")
        listCell.totalItemsLabel.text = String(describing: "\(listData[indexPath.row].itemCount)")
        listCell.totalPriceLabel.text = String(describing: "\(listData[indexPath.row].price)")
        
        return listCell
    }
    
}

extension OrderListTableViewController: ListManagerDelegate {
    
    func manager(_ manager: LoadList, lists: [List]) {
        
        self.listData += lists
        
        listTableView.reloadData()
        
    }

}
