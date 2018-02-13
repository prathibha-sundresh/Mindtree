//
//  ViewController.swift
//  LoginApp
//
//  Created by Prathibha Sundresh on 2/12/18.
//  Copyright © 2018 Prathibha Sundresh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Login
    @IBAction func Login(_ sender: Any) {
        
        let api =  CoreAPI.sharedManaged
        api .Login(url: "https://api.ufs.com/auth/authenticate?profileCountry=AT&site=ufs-at&country=AT",completion1 : { (success) -> Void in
            
            let response = UIAlertController(title: "Authenticate", message: NSString(data: success, encoding: String.Encoding.utf8.rawValue)! as String, preferredStyle: UIAlertControllerStyle.alert)
            
            response.addAction(UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction!) in

                self.navigate()
                
            })
            
            self.present(response, animated: true)
            
        })
    }
    
    func navigate() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "TableView")
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: LoadView
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

