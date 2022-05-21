//
//  dashboardViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit

var balances:[Balance]?

class dashboardViewController: UIViewController {
    var username: String = "sample";
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
        
        print("dashboard - \(username)")
    }
    
    @IBAction func createButton(_ sender: Any) {
        // create alert
        let alert = UIAlertController(title: "New Invoice", message: "Enter all required information", preferredStyle: .alert)
//        alert
        alert.addTextField();
        alert.addTextField();
        alert.addTextField();
        
        // get the textfield
        let typeTF = alert.textFields![0];
        let amountTF = alert.textFields![1];
        let categoryTF = alert.textFields![2];
        
        typeTF.placeholder = "Income or Expense?";
        amountTF.placeholder = "Enter Amount";
        categoryTF.placeholder = "Which Category";
        
        let addButton = UIAlertAction(title: "Create", style: .default) { (action) in
            // create the invoice object
            let newInvoice = Balance(context: self.context);
            let amount = (amountTF.text! as NSString).floatValue;
            
            newInvoice.createInvoice(username: self.username, type: typeTF.text ?? "", amount: Double(amount), category: categoryTF.text ?? "")
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        // add button
        alert.addAction(addButton);
        alert.addAction(cancelButton);
        
        // show alert
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func viewProfileButton(_ sender: Any) {
        // perform segue programmatically
        self.performSegue(withIdentifier: "goToProfile", sender: nil);
    }
    
    @IBAction func viewCategory(_ sender: Any) {
        // perform segue programmatically
        self.performSegue(withIdentifier: "goToCategory", sender: nil);
    }
    
    
    // function to pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check whether it is the right segue
        if (segue.identifier == "goToProfile") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                profileViewController {
                
                destinationVC.username = username;
            }
        } else if (segue.identifier == "goToCategory") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                selectCategoryViewController {
                destinationVC.username = username;
            }
        }
    }

}
