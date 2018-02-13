//
//  SSHttpRequest.swift
//  LoginApp
//
//  Created by Prathibha Sundresh on 2/12/18.
//  Copyright © 2018 Prathibha Sundresh. All rights reserved.
//

import Foundation
import SwiftyJSON

class SSHttpRequest {
    
    var request : URLRequest?
    var response : URLResponse?
    static var baseURL : String?


    func invokeResponseWithMethod()  {
        request!.addValue("a23h6lsLjXZOoljihm0t3i8xen0uhF4aMQdh6Aog", forHTTPHeaderField: "x-api-key")
        request!.addValue("Basic Z3VkZHUxQG1haWxpbmF0b3IuY29tOlBhc3N3b3JkMUA=", forHTTPHeaderField: "Authorization")
        self.request?.httpMethod = "GET"
        aSynchronousMethod(completion: { (success) -> Void in
            print("success \(success)")
        })
    }
    
    // MARK: SetBody in case of POST
    func setBody(body:Any) -> Void {
        request!.httpBody = try? JSONSerialization.data(withJSONObject: body, options:.prettyPrinted)
    }
    
    func setValue(value:String, type:String) -> Void {
        request!.addValue(value, forHTTPHeaderField: type)
    }
    
    init(withuUrl:String) {
        
        let formattedURL:String = withuUrl

            guard let requestUrl = URL(string:formattedURL) else {
                return
            }
            request = URLRequest(url: requestUrl)
            request!.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
    }
    
    // MARK: async Method for tableView
    func aSynchronousMethodForTableView(completion: @escaping (Data) -> ()) {
        request!.addValue("a23h6lsLjXZOoljihm0t3i8xen0uhF4aMQdh6Aog", forHTTPHeaderField: "x-api-key")
        request!.addValue("Basic dGVzdHRwY3Jhc2gxQG1haWxpbmF0b3IuY29tOkFAMTIzNDU2Nzg5", forHTTPHeaderField: "Authorization")
        self.request?.httpMethod = "GET"
        self.request?.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let task =  URLSession.shared.dataTask(with: request!) { (data:Data?, response:URLResponse?, error:Error?) in
            if response != nil {
        
                completion(data!)
            }
            if let error = error {
                print(error)
            }
        }
        task.resume()

    }
    
    //MARK: For Login and Profile
    func aSynchronousMethod(completion: @escaping (Data) -> ()) {
        request!.addValue("a23h6lsLjXZOoljihm0t3i8xen0uhF4aMQdh6Aog", forHTTPHeaderField: "x-api-key")
        request!.addValue("Basic Z3VkZHUxQG1haWxpbmF0b3IuY29tOlBhc3N3b3JkMUA=", forHTTPHeaderField: "Authorization")
        self.request?.httpMethod = "GET"
        
        let task =  URLSession.shared.dataTask(with: request!) { (data:Data?, response:URLResponse?, error:Error?) in
            if response != nil {
                completion(data!)
            }
        
            if let error = error {
                print(error)
            }
        }
        task.resume()
  
    }
    
}
