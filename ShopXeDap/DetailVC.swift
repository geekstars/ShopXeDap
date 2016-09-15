//
//  DetailVC.swift
//  ShopXeDap
//
//  Created by Hoàng Minh Thành on 9/15/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class DetailVC: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    @IBOutlet weak var imgXeDap: UIImageView!
    @IBOutlet weak var text_content: UITextView!
    var labelXeDap:String?
    var content: String?
    var nameImages: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = labelXeDap
        self.navigationController?.navigationBar.backItem?.backBarButtonItem?.title = "Back"
        text_content.text = content
        imgXeDap.image = UIImage(named: "\(nameImages[0]).jpg")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameImages.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let imageView = UIImageView(frame: CGRectMake(0, 0, 100, 100))
        let image =  UIImage(named: "\(nameImages[indexPath.row]).jpg")
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
        cell.addSubview(imageView)
        return cell
    }
    
    func pushView(index:Int)
    {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ImagesVC") as? ImagesVC
        listView!.pageImages = nameImages
        listView?.currentPage = index
        self.navigationController?.pushViewController(listView!, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        let imagesVC = self.storyboard?.instantiateViewControllerWithIdentifier("ImagesVC") as! ImagesVC
//        
//        imagesVC.pageImages = nameImages
        pushView(Int(indexPath.row))
        //self.navigationController?.pushViewController(imagesVC, animated: true)
    }
}
