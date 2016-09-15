//
//  DataManager.swift
//  ShopXeDap
//
//  Created by Hoàng Minh Thành on 9/15/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import Foundation

class DataManager {
    var items: [Item] = []
    var data = NSMutableArray()
    class var sharedInstance: DataManager {
        struct Static {
            static var onceToken:dispatch_once_t = 0
            static var instance: DataManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = DataManager()
            let filePath = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
            let myDict = NSDictionary(contentsOfFile: filePath!)
            let temp = NSMutableArray(capacity: myDict!.count)
            for dic in (myDict!.allValues) {
                
                let xedap = Item(name: dic["name"] as! String,content: dic["content"] as! String,nameImages: dic["images"] as! NSArray as! [String],price: dic["price"] as! String)
                temp.addObject(xedap)
            }
            Static.instance?.data = NSMutableArray(array: temp)
        }
        return Static.instance!
    }

}
