//
//  dashboardViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit
import CoreData

class dashboardViewController: UIViewController {
    
    var username: String = "sample";
    var pwd: String = "sample";
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var invoices:[Balance]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
        fetchBalance()
    }
    func fetchBalance(){
        do{
            self.invoices = try context.fetch(Balance.fetchRequest())
        }
        catch{
            
        }
    }
    
    @IBAction func createButton(_ sender: Any) {
        // create alert
        let alert = UIAlertController(title: "New Invoice", message: "Enter all required information ", preferredStyle: .alert)
        alert.addTextField();
        alert.addTextField();
        alert.addTextField();
        alert.addTextField();
        
        let titleTF = alert.textFields![0];
        let typeTF = alert.textFields![1];
        let amountTF = alert.textFields![2];
        let categoryTF = alert.textFields![3];

        titleTF.placeholder = "Enter Title";
        typeTF.placeholder = "Income or Expense?";
        amountTF.placeholder = "Enter Amount";
        categoryTF.placeholder = "Which Category";
        
        
        let addButton = UIAlertAction(title: "Create", style: .default) { (action) in
            // action
            let newInvoice = Balance(context: self.context)
            let doubleAmount = Double(amountTF.text!)

            newInvoice.title = titleTF.text
            newInvoice.type = typeTF.text
            newInvoice.amount = doubleAmount ?? 0.00
            newInvoice.category = categoryTF.text
            
            do {
                try self.context.save()
            }
            catch{
                
            }
        }
        self.fetchBalance()
        
        // add button
        alert.addAction(addButton);
        
        // show alert
        self.present(alert, animated: true, completion: nil);
    }
    

}
