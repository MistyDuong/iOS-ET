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
        
        if (category != "Rent" || category != "Transport" || category != "Utilities" || category != "Others" || category != "Entertainment" || category != "Groceries") {
            self.category = "Others";
        } else {
            self.category = category;
        }
        
        self.date = currentDate;
        
        do {
            try self.context.save();
        } catch {
            print("unable to create new invoices")
        }
    }
    
    // fetch balance of specific user based on category
    func fetchBalanceCategory(_ userName: String, _ category: String) -> NSFetchRequest<Balance> {
        let request = Balance.fetchRequest() as NSFetchRequest<Balance>

        // set the filtering
        let predicateUser = NSPredicate(format: "userName CONTAINS '\(userName)' ")
        request.predicate = predicateUser;

        // if request if not "all" category; filter the category then return the request
        // else return the request without filtering the category
        if category != "All" {
            let predicateCategory = NSPredicate(format: "category CONTAINS '\(category)' ")
            request.predicate = predicateCategory;
            return request;
        }
        
        return request;
    }
    
    // calculate func that determines the total balance (income - expense) based on the filtered data and selected category
    func calculateAmount(_ username: String, _ filteredCategory: [Balance], _ selectedCategory: String) -> Double {
        var result: Double = 0;
        
        // for-loop to calculate the all the income of the selected category
        for data in filteredCategory as [NSManagedObject] {
            let user = data.value(forKey: "userName") as? String;
            let categories = data.value(forKey: "category") as? String;
            let type = data.value(forKey: "type") as? String;
            
            if user == username && categories == selectedCategory && type == "Income" {
                let toCalculateIncome = data.value(forKey: "amount") as! Double;
                result += toCalculateIncome;
            }
        }
        
        // for-loop to calculate the all the expense of the selected category
        for data in filteredCategory as [NSManagedObject] {
            let user = data.value(forKey: "userName") as? String;
            let categories = data.value(forKey: "category") as? String;
            let type = data.value(forKey: "type") as? String;
            
            if user == username && categories == selectedCategory && type == "Expense" {
                let toCalculateExpense = data.value(forKey: "amount") as! Double;
                result -= toCalculateExpense;
            }
        }

        return result;
    }
    
    // retrieve balance of user based on type (income/expense)
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
