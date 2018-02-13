//
//  ProfileViewcontroller.swift
//  LoginApp
//
//  Created by Prathibha Sundresh on 2/13/18.
//  Copyright © 2018 Prathibha Sundresh. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ProfileViewcontroller  {
    var values:ProfileValues?
    func call() {
        
        values = ProfileValues(names: "Prathibhs", password: "password")
//        save()
        FetchData()
    }
   var profile: [NSManagedObject] = []
    
    // MARK: Save data
    func save() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Profile", in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        person.setValue(values?.names, forKeyPath: "username")
        person.setValue(values?.password, forKey: "password")
        
        do {
            try managedContext.save()
            profile.append(person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    // MARK: FetchData
    func FetchData() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Profile")
        
        do {
          
            profile = try managedContext.fetch(fetchRequest)
            for value in profile {
                print(value.value(forKey: "username") as! String)
                print(value.value(forKey: "password") as! String)
            }
  
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}
