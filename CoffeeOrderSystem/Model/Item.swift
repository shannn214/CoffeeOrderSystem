//
//  Item.swift
//  CoffeeOrderSystem
//
//  Created by 尚靖 on 2018/6/18.
//  Copyright © 2018年 尚靖. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

protocol itemsManager: class {
    func manager(_ manager: LoadItems, items: [Items])
}

struct Items {
    
    let name: String
    
    let price: Int
    
    let image: String
    
}

struct LoadItems {
    
    weak var delegate: itemsManager?
    
    func loadItemData() {
        
        let ref = Database.database().reference()
        
        let itemData = ref.child("items")
        
        itemData.observeSingleEvent(of: .value) { (snapshot: DataSnapshot) in
            
            var items = [Items]()
            
            for snap in snapshot.children {
                
                guard let itemData = (key: (snap as! DataSnapshot).key, value: (snap as! DataSnapshot).value) as? (key: String, value: AnyObject) else { return }
                
                guard let image = itemData.value["image"] as? String,
                      let name = itemData.value["name"] as? String,
                      let price = itemData.value["price"] as? Int
                else { return }
                
                print(image)
                print("---------------")

                let itemsData = Items(name: name, price: price, image: image)
                
                items.append(itemsData)
                
            }
            
            DispatchQueue.main.async {
                self.delegate?.manager(self, items: items)
            }
            
//            print(snapshot)
//            print("================")
//            print(snapshot.children)
//            print("-----------------")
//            print(snapshot.value)
            
        }
        
    }
    
    
    
    
}

