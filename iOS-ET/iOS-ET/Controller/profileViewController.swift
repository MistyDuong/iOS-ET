//
//  profileViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit
import CoreData

class profileViewController: UIViewController {
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    
    @IBOutlet weak var totalBalanceLabel: UILabel!
    @IBOutlet weak var totalExpenseLabel: UILabel!
    @IBOutlet weak var totalIncomeLabel: UILabel!
    @IBOutlet weak var monthlyIncome: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    var username: String = "hello";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide navbar and retieve data of specific user from core data and display to screen
        self.navigationController?.isNavigationBarHidden = true;
        self.fetchUser();
        
//        print("profile - \(username)");
    }
    
    func fetchUser() {
        do {
            let fetchUser = User(context: self.context);
            let request = fetchUser.fetchUser(username)
            let result = try context.fetch(request);
            
            for data in result as [NSManagedObject] {
                let montlyIncome = data.value(forKey: "monthIncome") as! NSNumber;
                let spendingLimit = data.value(forKey: "spendingLimit") as! NSNumber;
                
                firstNameLabel.text = data.value(forKey: "firstName") as? String;
                lastNameLabel.text = data.value(forKey: "lastName") as? String;
                monthlyIncome.text = montlyIncome.stringValue;
                limitLabel.text = spendingLimit.stringValue;
                userNameLabel.text = data.value(forKey: "userName") as? String;
                pwdLabel.text = data.value(forKey: "pwd") as? String;
            }
        } catch {
            print("unable to retrieve data")
        }
    }
    
    @IBAction func incomeButton(_ sender: Any) {
        let alert = UIAlertController(title: "Update Income", message: "New Monthly Income: ", preferredStyle: .alert)
        alert.addTextField();
        
        let incomeTF = alert.textFields![0];
        incomeTF.text = monthlyIncome.text;
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            // call the update func and reload data display on screen
            let updateUser = User(context: self.context);
            updateUser.updateUser(username: self.username, data: incomeTF.text ?? "", type: "Income")
            self.viewDidLoad();
        }
        
        // add button and show alert
        alert.addAction(saveButton);
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func limitButton(_ sender: Any) {
        // create alert
        let alert = UIAlertController(title: "Update Spending Limit", message: "New Spending Limit: ", preferredStyle: .alert)
        alert.addTextField();
        
        let limitTF = alert.textFields![0];
        limitTF.text = limitLabel.text;
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            // action
            let updateUser = User(context: self.context);
            updateUser.updateUser(username: self.username, data: limitTF.text ?? "", type: "Spending")
            self.viewDidLoad();
        }
        
        // add button and show alert
        alert.addAction(saveButton);
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func pwdButton(_ sender: Any) {
        let alert = UIAlertController(title: "Update password", message: "New password: ", preferredStyle: .alert)
        alert.addTextField();
        
        let pwdTF = alert.textFields![0];
        pwdTF.text = pwdLabel.text;
        
        // configure the handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            // action
            let updateUser = User(context: self.context);
            updateUser.updateUser(username: self.username, data: pwdTF.text ?? "", type: "pwd")
            self.viewDidLoad();
        }
        
        // add button and show alert
        alert.addAction(saveButton);
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func dashboardButton(_ sender: Any) {
        // perform segue programmatically
        self.performSegue(withIdentifier: "backToDash", sender: nil);
    }
    
    // function to pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check whether it is the right segue
        if (segue.identifier == "backToDash") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                dashboardViewController {
                destinationVC.username = self.username;
            }
        }
    }
    
}
