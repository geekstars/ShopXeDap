//
//  ViewController.swift
//  ShopXeDap
//
//  Created by Hoàng Minh Thành on 9/14/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate {
    //var items: [Item] = []
    var dataManager = DataManager.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
//        var myDict: NSDictionary?
//        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist")
//        {
//            myDict = NSDictionary(contentsOfFile: path)
//        }
//        for dic in (myDict!.allValues) {
//            
//            items.append(Item(name: dic["name"] as! String,content: dic["content"] as! String,nameImages: dic["images"] as! NSArray as! [String],price: dic["price"] as! String))
//        }
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return items.count
        return dataManager.data.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        let xedap = dataManager.data[indexPath.item] as! Item
        cell.addSubviews()
//        print(xedap.name)
//        print(xedap.nameImages)
//        print(xedap.content)
//        print(xedap.price)
        cell.imageView.image = UIImage(named: xedap.nameImages[0]+".jpg")
        cell.nameLabel.text = xedap.name
        cell.price.text = xedap.price
        //print(items[indexPath.item])
        
//        cell.imageView.image = UIImage(named: items[indexPath.item].nameImages[0]+".jpg")
//        cell.nameLabel.text = items[indexPath.item].name
//        cell.price.text = items[indexPath.item].price
        return cell
        
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! DetailVC
        let xedap = dataManager.data[indexPath.row] as! Item
        
        detailVC.labelXeDap = xedap.name
        detailVC.nameImages = xedap.nameImages
        detailVC.content = xedap.content
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

