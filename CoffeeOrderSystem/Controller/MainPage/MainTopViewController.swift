//
//  MainTopViewController.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import UIKit
import SDWebImage

protocol TopViewDelegate: class {
    func sendTopViewData(_ controller: MainTopViewController, selectedItem: Items?)
}

class MainTopViewController: UIViewController {

    @IBOutlet weak var topCollectionView: UICollectionView!
    
    weak var topViewDelegate: TopViewDelegate?
    
    var item = LoadItems()
    
    var itemData = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()

        setupLayout()
        
        item.delegate = self
        
        item.loadItemData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupCollectionView() {
        
        let nib = UINib(nibName: String(describing: MainTopCollectionViewCell.self), bundle: nil)
        
        topCollectionView.register(nib, forCellWithReuseIdentifier: String(describing: MainTopCollectionViewCell.self))
        topCollectionView.delegate = self
        topCollectionView.dataSource = self
        
    }
    
    private func setupLayout() {
        
        if let setLayout = topCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            
            let itemSize = 81
            setLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
            setLayout.itemSize = CGSize(width: itemSize, height: 81)
            setLayout.minimumLineSpacing = 10
            setLayout.minimumInteritemSpacing = 10
            
        }
        
    }

}

extension MainTopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let topCell = topCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MainTopCollectionViewCell.self), for: indexPath) as? MainTopCollectionViewCell else { return UICollectionViewCell() }
        
        topCell.topImage.sd_setImage(with: URL(string: itemData[indexPath.row].image))
        
        return topCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.topViewDelegate?.sendTopViewData(self, selectedItem: itemData[indexPath.row])
        
    }
    
}

extension MainTopViewController: itemsManager {
    
    func manager(_ manager: LoadItems, items: [Items]) {
        
        self.itemData += items
        
        topCollectionView.reloadData()
        
    }
    
}
