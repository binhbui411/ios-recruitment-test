//
//  ViewController.swift
//  iOSRecruitmentTest
//
//  Created by Bazyli Zygan on 15.06.2016.
//  Copyright © 2016 Snowdog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    let tableView = UITableView.init()
    
    var data: [ItemModel] = []
    var maxOffset = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.addTableView()
        self.fetchData(offset: 0)
        
    }
    
    func addTableView(){
        
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "search")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
        self.view.addConstraints(
            [
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.left,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.left,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.right,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.right,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.top,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.top,
                    multiplier: 1.0,
                    constant: 0
                ),
                NSLayoutConstraint.init(
                    item: self.tableView,
                    attribute: NSLayoutAttribute.bottom,
                    relatedBy: NSLayoutRelation.equal,
                    toItem: self.view,
                    attribute: NSLayoutAttribute.bottom,
                    multiplier: 1.0,
                    constant: 0
                )
            ]
        )
    }
    
    // MARK: - UITableView data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : self.data.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "search", for: indexPath) as! SearchTableViewCell
            
            cell.callback = { (text) in
                print(text)
                
            }
            return cell
        }
        
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        let model = self.data[indexPath.row]
        
        cell.iconView.sd_setImage(with: URL.init(string: model.icon ?? "https://s-media-cache-ak0.pinimg.com/originals/02/e3/ae/02e3ae47c02080e9d9c0b915b3c382e8.jpg" ))
        cell.itemTitleLabel.text = model.name ?? "nazwa testowa"
        cell.itemDescLabel.text =  model.description ?? "testowy opis"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func resetData(){
        self.fetchData(offset: 0)
    }
    
    func fetchData(offset: Int){
        
        if offset == 0 {
            self.data.removeAll()
            self.maxOffset = -1
        } else if offset == self.maxOffset {
            return
        }
        
        self.maxOffset = offset
        
        Network.GetItems(offset: offset).responseModelArray(
            successCompletion: { (models:[ItemModel]) in
                self.data.append(contentsOf: models)
                self.tableView.reloadData()
                
        }){ (errorMessage) in
            
        } 
        
    }
    
}
