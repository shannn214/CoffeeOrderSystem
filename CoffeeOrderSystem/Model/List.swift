//
//  List.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

protocol ListManagerDelegate: class {
    func manager(_ manager: LoadList, lists: [List])
}

struct List {
    
    let number: String
    
    let account: String
    
    let time: Int
    
    let itemCount: Int
    
    let price: Int
    
}

struct LoadList {
    
    weak var delegate: ListManagerDelegate?
    
    func loadData() {
        
        let ref = Database.database().reference()
        
        let data = ref.child("orders").queryOrdered(byChild: "account").queryEqual(toValue: "wayne.chen@awscafe.tw")
        
        var listData = [List]()
        
        data.observe(.value) { (snapshot: DataSnapshot) in
            
            for snap in snapshot.children {
                
                guard let data = (key: (snap as! DataSnapshot).key, value: (snap as! DataSnapshot).value) as? (key: String, value: AnyObject) else { return }
                
                guard let number = data.key as? String,
                    let account = data.value["account"] as? String,
                    let time = data.value["time"] as? Int,
                    let itemCount = data.value["itemCount"] as? Int,
                    let price = data.value["price"] as? Int
                    else { return }
                
                let getListData = List(number: number, account: account, time: time, itemCount: itemCount, price: price)
                
                listData.append(getListData)
                
            }
            
            DispatchQueue.main.async {
                
                self.delegate?.manager(self, lists: listData)
                
            }
            
        }
        
    }
    
}
