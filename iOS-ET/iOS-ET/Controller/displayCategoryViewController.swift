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
    
    var amount: Double = 0.0
    var acountName: String = " "
    var selectedCategory: String = "";
    var categoryTitle: String = "Hello";
    var balance:[Balance]?
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBalance()
        
        // hide the nav bar
        self.navigationController?.isNavigationBarHidden = true;
        
        titleLable.text = categoryTitle;
    }
    
    func fetchBalance(){
        do{
            let request = Balance.fetchRequest() as NSFetchRequest<Balance>
            
            if(selectedCategory == "All"){
                let pred = NSPredicate(format: "category == 'All'")
                request.predicate = pred
            }
            
            else if(selectedCategory == "Rent"){
                let pred = NSPredicate(format: "category == 'Rent'")
                request.predicate = pred
            }
            
            else if(selectedCategory == "Groceries"){
                let pred = NSPredicate(format: "category == 'Groceries'")
                request.predicate = pred
            }
            
            else if(selectedCategory == "Transport"){
                let pred = NSPredicate(format: "category == 'Transport'")
                request.predicate = pred
            }
            
            else if(selectedCategory == "Utilities"){
                let pred = NSPredicate(format: "category == 'Utilities'")
                request.predicate = pred
            }
            
            else if(selectedCategory == "Entertainment"){
                let pred = NSPredicate(format: "category == 'Entertainment'")
                request.predicate = pred
            }

            else if(selectedCategory == "Others"){
                let pred = NSPredicate(format: "category == 'Others'")
                request.predicate = pred
            }
            
            let sort = NSSortDescriptor(key: "date", ascending: true)
            request.sortDescriptors = [sort]
            self.balance = try context.fetch(request)
            
        }catch{
            
        }
        DispatchQueue.main.async {
            
        }
    }
}

extension displayCategoryViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension displayCategoryViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // initiate row if there are not any
        /*if(sortedHighScore.count == 0){
            return(1)
        }*/
        return balance?.count ?? 1
    }

        
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "displayExpense", for: indexPath)
        //let score=highScore[indexPath.row]
        // retrieves existed data and put in cell
        /*if sortedHighScore.count != 0{
            cell.textLabel?.text = "\(sortedHighScore[indexPath.row].key)"
            cell.detailTextLabel?.text = "Score: \(sortedHighScore[indexPath.row].value)"

        } else{
            // no data scenerio
            cell.textLabel?.text = "NO HIGH SCORE YET!"
            cell.detailTextLabel?.text = ""
        }*/
        let detail = self.balance![indexPath.row]
        cell.textLabel?.text=detail.type
        cell.detailTextLabel?.text=String(detail.amount)
        return cell
    }
}
