//
//  dashboardViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit

class dashboardViewController: UIViewController {
    
    var username: String = "sample";
    var pwd: String = "sample";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    
    @IBAction func createButton(_ sender: Any) {
        // create alert
        let alert = UIAlertController(title: "New Invoice", message: "Enter all required information ", preferredStyle: .alert)
        alert.addTextField();
        alert.addTextField();
        alert.addTextField();
        
        let typeTF = alert.textFields![0];
        let amountTF = alert.textFields![1];
        let categoryTF = alert.textFields![2];
        
        typeTF.placeholder = "Income or Expense?";
        amountTF.placeholder = "Enter Amount";
        categoryTF.placeholder = "Which Category";
        
        let addButton = UIAlertAction(title: "Create", style: .default) { (action) in
            // action
        }
        
        // add button
        alert.addAction(addButton);
        
        // show alert
        self.present(alert, animated: true, completion: nil);
    }
    

}
