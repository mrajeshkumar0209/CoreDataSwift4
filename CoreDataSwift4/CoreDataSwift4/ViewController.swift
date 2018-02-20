//
//  ViewController.swift
//  CoreDataSwift4
//
//  Created by Rajeshkumar maddi on 19/02/18.
//  Copyright © 2018 SaiRajesh. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var mobile:[Mobile]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        if CoreDataHandler.savaDataToCoredata(name: "iPhone", model: "8+", company: "Apple", price: 90000){
        mobile = CoreDataHandler.fetchdata()
            print("Before Single object delete")
             print(mobile?.count)
            //Deleting single Object
            /*
            if CoreDataHandler.deleteObject(mobile: mobile![0])
            {
                //Verifying deletion
                mobile = CoreDataHandler.fetchdata()
                print("After Single object delete")
                print(mobile?.count)
            }*/
        }
//Deleting complete data from coredata
        /*
        if CoreDataHandler.cleanDelete(){
          mobile = CoreDataHandler.fetchdata()
            print(mobile?.count)
        }
         */

//Update data
        
        /*
         if CoreDataHandler.updateObject(search: 120000, name: "iPhone", model: "X", company: "Apple", price: 100000){
         mobile = CoreDataHandler.fetchdata()
         for data in (mobile)!{
         print(data.value(forKey: "name"),data.value(forKey: "Company"),data.value(forKey: "price"))
         }
         }
         */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

