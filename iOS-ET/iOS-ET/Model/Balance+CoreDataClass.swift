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
//    func fetchBalance(userName: String, category: String) -> NSFetchRequest<Balance> {
//
//        return request;
//    }
}
