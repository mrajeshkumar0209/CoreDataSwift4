//
//  CoreDataHandler.swift
//  CoreDataSwift4
//
//  Created by Rajeshkumar maddi on 19/02/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {
    
    private class func getContext() -> NSManagedObjectContext{
        let Appdelegate = UIApplication.shared.delegate as! AppDelegate
        return Appdelegate.persistentContainer.viewContext
    }
    
    class func savaDataToCoredata(name:String,model:String,company:String,price:Float) -> Bool
    {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Mobile", in: context)
        let newMobile = NSManagedObject(entity: entity!, insertInto: context)
        newMobile.setValue(name, forKey: "name")
        newMobile.setValue(model, forKey: "model")
        newMobile.setValue(company, forKey: "company")
        newMobile.setValue(price, forKey: "price")
        do {
            try context.save()
            return true
        }catch{
            print("Error with saving object to Coredata")
            return false
        }
    }

    class func fetchdata() -> [Mobile]?{
       let context = getContext()
        var mobile:[Mobile]? = nil
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Mobile")
        //request.predicate = NSPredicate(format: "company = %@", "Apple")
        request.returnsObjectsAsFaults = false

        do{
            mobile = try  context.fetch(request) as? [Mobile]
            return mobile
        }catch{
            print("Error with Fetch data from Coredata")
            return mobile
        }
    }
    class func deleteObject(mobile:Mobile)-> Bool{
        let context = getContext()
        context.delete(mobile)
        do{
            try context.save()
            return true
        }catch{
            return false
        }
    }
    class func cleanDelete()->Bool{
       let context = getContext()
       let delete = NSBatchDeleteRequest(fetchRequest: Mobile.fetchRequest())
        do{
            try context.execute(delete)
            return true
        }catch{
            return false
        }
    }
    class func updateObject(search:Float,name:String,model:String,company:String,price:Float) ->Bool{
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Mobile")
        let context = getContext()
        let predicate = NSPredicate(format: "price = '\(search)'")
        fetchRequest.predicate = predicate
        do
        {
            let test = try context.fetch(fetchRequest)
            if test.count == 1
            {
                let objectUpdate = test[0] as! NSManagedObject
                objectUpdate.setValue(name, forKey: "name")
                objectUpdate.setValue(model, forKey: "model")
                objectUpdate.setValue(company, forKey: "company")
                objectUpdate.setValue(price, forKey: "price")
                do{
                    try context.save()
                }
                catch
                {
                    print(error)
                }
            }
        }
        catch
        {
            print(error)
        }
        return true
    }
}
