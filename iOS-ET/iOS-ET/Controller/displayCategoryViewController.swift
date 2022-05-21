//
//  detailExpenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit
import CoreData

class displayCategoryViewController: UIViewController {
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    var username: String = "hello"
    var categoryTitle: String = "Hello";
    
//    var amount: Double = 0.0
//    var acountName: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the nav bar
        self.navigationController?.isNavigationBarHidden = true;
        titleLable.text = categoryTitle;
        fetchBalance();
        
        print("display - \(username)")
    }
    
    func fetchBalance() {
        do {
            let request = Balance.fetchRequest() as NSFetchRequest<Balance>
            balances = try context.fetch(request);
            DispatchQueue.main.async {
                self.detailTable.reloadData();
            }
        } catch {
                print("unable to retrieve data")
            }
    }
}

extension displayCategoryViewController: UITableViewDelegate, UITableViewDataSource {
    // return table rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balances?.count ?? 0;
    }
    
    // display data into tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayExpense", for: indexPath)
        let balance = balances![indexPath.row];
        
        // reformat the data for display uses
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "dd/MM/YYYY";
                
        // display data to corresponding cells
        cell.textLabel?.text = String(balance.amount);
        cell.detailTextLabel?.text = dateFormatter.string(from: balance.date!);
        
        // set background color based on type of data
        if balance.type == "Income" {
            cell.contentView.backgroundColor = UIColor.systemTeal;
        } else {
            cell.contentView.backgroundColor = UIColor.systemOrange;
        }
        
        // return cell
        return cell
    }
    
    // delete func
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        // create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") {
            (action, view, completionHandler) in
            
            // which data to delete
            let personToRemove = balances![indexPath.row];
            
            // remove the data
            self.context.delete(personToRemove);
            
            // save the data
            do {
                try self.context.save();
            } catch {
                
            }
            
            // re-fetch the data
            self.fetchBalance();
        }

        // return the swipe action
        return UISwipeActionsConfiguration(actions: [action]);
    }
}
