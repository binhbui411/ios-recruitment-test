//
//  TableViewCell.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    let titleLabel = UILabel.init()
    let subtitleLabel = UILabel.init()
    
    let iconView = UIImageView.init()
    let itemTitleLabel = UILabel.init()
    let itemDescLabel = UILabel.init()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.iconView.translatesAutoresizingMaskIntoConstraints = false
        self.iconView.autoresizesSubviews = true
        self.iconView.isOpaque = true
        self.iconView.contentMode = .scaleToFill
        
        self.addSubview(self.iconView)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.iconView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.iconView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.iconView,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 56
                ),
                NSLayoutConstraint.init(
                    item: self.iconView,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.iconView,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
        
        self.itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.itemTitleLabel.autoresizesSubviews = true
        
        self.addSubview(self.itemTitleLabel)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.itemTitleLabel,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.iconView,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.itemTitleLabel,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.itemTitleLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 4
                ),
                ]
        )
        
        self.itemDescLabel.translatesAutoresizingMaskIntoConstraints = false
        self.itemDescLabel.autoresizesSubviews = true
        
        self.addSubview(self.itemDescLabel)
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.itemDescLabel,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.itemTitleLabel,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.itemDescLabel,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.iconView,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
                NSLayoutConstraint.init(
                    item: self.itemDescLabel,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
                ]
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
