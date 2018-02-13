//
//  CoreAPI.swift
//  LoginApp
//
//  Created by Prathibha Sundresh on 2/12/18.
//  Copyright © 2018 Prathibha Sundresh. All rights reserved.
//

import Foundation

class CoreAPI {
    
    static let sharedManaged = CoreAPI()
    
    private init() {
        // Do something if needed
    }
    
    func Login(url:String, completion1: @escaping (Data) -> ()) {
        let request = SSHttpRequest(withuUrl: url)
        request . aSynchronousMethod(completion: { (success) -> Void in
            print("success Login \(success)")
            completion1(success)
        })
    }
    
    func displayData(url:String, completion1: @escaping (Data) -> ()) {
        let request = SSHttpRequest(withuUrl: url)
        request . aSynchronousMethodForTableView(completion: { (success) -> Void in
            completion1(success)
        })
    }
    
    func Profile(url:String) -> Void {
        let request = SSHttpRequest(withuUrl: url)
        request.setValue(value: "a23h6lsLjXZOoljihm0t3i8xen0uhF4aMQdh6Aog", type: "x-api-key")
        request.setValue(value: "Basic Z3VkZHUxQG1haWxpbmF0b3IuY29tOlBhc3N3b3JkMUA=", type: "Authorization")
    }
}
