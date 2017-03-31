//
//  MainViewController.swift
//  iOSRecruitmentTest
//
//  Created by szymon on 30.03.2017.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let main = UILabel.init()
    let bottom = UILabel.init()
    let button = UIButton.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.tapAction(sender:)))
        self.view.addGestureRecognizer(tapGesture)
        
        self.main.translatesAutoresizingMaskIntoConstraints = false
        self.main.text = "iOSRecruitmentTest"
        self.main.font = UIFont.systemFont(ofSize: UIFont.systemFontSize + 8, weight: 24)
        self.main.textAlignment = .center
        self.view.addSubview(self.main)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.main,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                
                NSLayoutConstraint.init(
                    item: self.main,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 112
                ),
                
                NSLayoutConstraint.init(
                    item: self.main,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: -4
                ),
                
                NSLayoutConstraint.init(
                    item: self.main,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
            ]
        )
        
        self.bottom.translatesAutoresizingMaskIntoConstraints = false
        self.bottom.text = "Copyright © 2016 Snowdog. All rights reserved."
        self.bottom.textAlignment = .center
        
        self.view.addSubview(self.bottom)
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.bottom,
                    attribute: NSLayoutAttribute.centerX,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.centerX,
                    multiplier: 1.0,
                    constant: 0
                ),
                
                NSLayoutConstraint.init(
                    item: self.bottom,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: -20
                ),
                
                NSLayoutConstraint.init(
                    item: self.bottom,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: -4
                ),
                
                NSLayoutConstraint.init(
                    item: self.bottom,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 4
                ),
            ]
        )

        
    }
    
   
    func tapAction(sender: UIGestureRecognizer) {
        
            self.navigationController?.pushViewController(ViewController(), animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
