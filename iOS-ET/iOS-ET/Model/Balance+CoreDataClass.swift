//
//  Balance+CoreDataClass.swift
//  iOS-ET
//
//  Created by Quy Dam on 18/5/2022.
//
//

import Foundation
import CoreData
import UIKit

@objc(Balance)
public class Balance: NSManagedObject {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    let currentDate = Date();
    
    // add function
    func createInvoice(username: String, type: String, amount: Double, category: String) {
        self.userName = username;
        self.type = type;
        self.amount = amount;
        self.category = category;
        self.date = currentDate;
        
        do {
            try self.context.save();
        } catch {
            print("unable to create new invoices")
        }
    }
    
    // fetch balance of specific user balance
//    func fetchBalanceCategory(_ userName: String, _ category: String) -> NSFetchRequest<Balance> {
//        let request = Balance.fetchRequest() as NSFetchRequest<Balance>
//
//        // set the filtering
//        let predicateUser = NSPredicate(format: "userName CONTAINS '\(userName)' ")
//        let predicateCategory = NSPredicate(format: "type CONTAINS '\(category)' ")
//
//        request.predicate = predicateUser;
//
//        if category != "All" {
//            request.predicate = predicateCategory;
//        }
//
//        return request;
//    }
    
    // retrieve user type (income/expense) from core data database
    func fetchBalanceType(_ userName: String,_ type: String) -> NSFetchRequest<Balance> {
        let request = Balance.fetchRequest() as NSFetchRequest<Balance>
        
        // set the filtering
        let predicateUser = NSPredicate(format: "userName CONTAINS '\(userName)' ")
        let predicateType = NSPredicate(format: "type CONTAINS '\(type)' ")
        
        // filter and return the filtered data
        request.predicate = predicateUser;
        request.predicate = predicateType;
        return request;
    }
}
