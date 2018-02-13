//
//  TableViewController.swift
//  LoginApp
//
//  Created by Prathibha Sundresh on 2/12/18.
//  Copyright © 2018 Prathibha Sundresh. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: TableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textColor = UIColor.brown
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.textLabel?.text = self.arrayNames[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let profile = ProfileViewcontroller()
        profile.call()
        
    }
    // MARK: Variables
    var arrayNames : Array<String> = []    
    
    // MARK: ViewLoads
    override func viewDidLoad() {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
        concurrentQueue.async {
            let api =  CoreAPI.sharedManaged
            api .displayData(url: "https://api.ufs.com/products/pnir/AT/de/categories?skip=0&take=5",completion1 : { (success) -> Void in
                print(success)
                let json = JSON(success)
                
                self.arrayNames =  json["hits"].arrayValue.map({$0["productName"].stringValue})
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            })
        }
       
    }

}
