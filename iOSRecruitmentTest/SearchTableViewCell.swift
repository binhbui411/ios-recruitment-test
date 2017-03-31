//
//  SearchTableViewCell.swift
//  iOSRecruitmentTest
//
//  Created by szymon on 30.03.2017.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    let textField = UITextField.init()
    var callback: ((String) -> Void)?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        self.backgroundColor = reuseIdentifier == "searchDark" ? UIColor.blue : UIColor.clear
        
        let frontView = UIView.init()
        frontView.backgroundColor = reuseIdentifier == "searchDark" ? UIColor.darkGray : UIColor.lightGray
        frontView.translatesAutoresizingMaskIntoConstraints = false
        frontView.layer.cornerRadius = 16
        self.addSubview(frontView)
        
        self.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: frontView,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: frontView,
                    attribute: NSLayoutAttribute.width,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.width,
                    multiplier: 0.9,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: frontView,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: frontView,
                    attribute: NSLayoutAttribute.height,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: nil,
                    attribute: NSLayoutAttribute.height,
                    multiplier: 1.0,
                    constant: 32
                ),
                ]
        )
        
        let icon = UIImageView.init(image: #imageLiteral(resourceName: "Search Icon"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        frontView.addSubview(icon)
        frontView.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: icon,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: frontView,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: icon,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: frontView,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 8
                ),
                ]
        )
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.textField.textColor = reuseIdentifier == "searchDark" ? UIColor.white : UIColor.blue
        
        self.textField.attributedPlaceholder = NSMutableAttributedString.init(string: "Search")
        self.textField.clearButtonMode = .whileEditing
        self.textField.addTarget(self, action: #selector(self.textFieldValueChange(sender:)), for: UIControlEvents.editingChanged)
        
        frontView.addSubview(self.textField)
        frontView.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.textField,
                    attribute: NSLayoutAttribute.centerY,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: frontView,
                    attribute: NSLayoutAttribute.centerY,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.textField,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: frontView,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 28
                ),
                NSLayoutConstraint.init(
                    item: self.textField,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: frontView,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: -6
                ),
                ]
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldValueChange(sender: UITextField){
        guard let function = self.callback else {
            return
        }
        
        function(sender.text ?? "")
    }
    
}
