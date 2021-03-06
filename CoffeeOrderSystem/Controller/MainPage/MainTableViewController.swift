//
//  MainTableViewController.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import UIKit
import SDWebImage

class MainTableViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    var selectedIndex: IndexPath?

    var selectedItem = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupTableView() {
        
        let nib = UINib(nibName: String(describing: OrderPageTableViewCell.self), bundle: nil)
        mainTableView.register(nib, forCellReuseIdentifier: String(describing: OrderPageTableViewCell.self))
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.rowHeight = 120
        
    }


}

extension MainTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let orderCell = mainTableView.dequeueReusableCell(withIdentifier: String(describing: OrderPageTableViewCell.self),
                                                                for: indexPath) as? OrderPageTableViewCell else { return UITableViewCell() }
        
        orderCell.coffeeTitle.text = selectedItem[indexPath.row].name
        orderCell.coffeeImage.sd_setImage(with: URL(string: selectedItem[indexPath.row].image))
        
        return orderCell
    }
    
    
    
    
}
