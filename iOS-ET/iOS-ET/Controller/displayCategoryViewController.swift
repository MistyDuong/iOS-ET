//
//  detailExpenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit

class displayCategoryViewController: UIViewController {
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    var amount: Double = 0.0
    var acountName: String = " "
    var selectedCategory: String = "";
    var categoryTitle: String = "Hello";
    var balance:[Balance]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the nav bar
        self.navigationController?.isNavigationBarHidden = true;
        
        titleLable.text = categoryTitle;
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
