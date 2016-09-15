//
//  CellItem.swift
//  ShopXeDap
//
//  Created by Hoàng Minh Thành on 9/14/16.
//  Copyright © 2016 Hoàng Minh Thành. All rights reserved.
//

import UIKit

class CellItem: UICollectionViewCell {
    var nameLabel: UILabel!
    var imageView: UIImageView!
    var price: UILabel!
    var kPriceLabelHeight: CGFloat = 30
    var kCellWidth: CGFloat = 140
    var kLabelHeight: CGFloat = 30
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func addSubviews() {
        if (imageView == nil)
        {
            imageView = UIImageView(frame: CGRectMake(0, 0,kCellWidth, kCellWidth))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
        }
        if (nameLabel == nil) {
            nameLabel = UILabel(frame: CGRectMake(0,kCellWidth,kCellWidth,kLabelHeight))
            nameLabel.textAlignment = .Left
            
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(13)
            nameLabel.textColor = UIColor.blackColor()
            nameLabel.numberOfLines = 2
            contentView.addSubview(nameLabel)
        }
        if(price == nil)
        {
            price = UILabel(frame: CGRectMake(0,kCellWidth + kLabelHeight,kCellWidth,kPriceLabelHeight))
            price.textAlignment = .Left
            //price.textColor = UIColor(red: 255/255,green: 116/225,blue: 35/255,alpha: 1)
            price.textColor = UIColor.redColor()
            price.font = UIFont.boldSystemFontOfSize(12)
            contentView.addSubview(price)
        }
        
    }
    override var selected: Bool {
        
        didSet {
            imageView.layer.borderWidth = selected ? 2 : 0
        }
    }

}
