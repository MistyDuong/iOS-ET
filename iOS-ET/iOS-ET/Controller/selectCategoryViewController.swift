//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit
import CoreData

class selectCategoryViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var rentLabel: UILabel!
    @IBOutlet weak var groceriesLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var utilitiesLabel: UILabel!
    @IBOutlet weak var entertainmentLabel: UILabel!
    @IBOutlet weak var othersLabel: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    var selectedCategory: String = "name";
    var username: String = "hello";
    var allAmount: String = "0";

    override func viewDidLoad() {
        super.viewDidLoad();
        
        // hide navbar
        self.navigationController?.isNavigationBarHidden = true;
        fetchBalance();
    }
    
    func fetchBalance(){
        do {
            let fetchBalance = Balance(context: self.context);
            
            // filter out the category
            let requestRent = fetchBalance.fetchBalanceCategory(self.username, "Rent");
            let requestGroceries = fetchBalance.fetchBalanceCategory(self.username, "Groceries");
            let requestTransport = fetchBalance.fetchBalanceCategory(self.username, "Transport");
            let requestUtilities = fetchBalance.fetchBalanceCategory(self.username, "Utilities");
            let requestEntertainment = fetchBalance.fetchBalanceCategory(self.username, "Entertainment");
            let requestOthers = fetchBalance.fetchBalanceCategory(self.username, "Others");
            
            let filteredRent = try context.fetch(requestRent);
            let filteredGroceries = try context.fetch(requestGroceries);
            let filteredTransport = try context.fetch(requestTransport);
            let filteredUtilities = try context.fetch(requestUtilities);
            let filteredEntertainment = try context.fetch(requestEntertainment);
            let filteredOthers = try context.fetch(requestOthers);
            
            // call the calculateAmount() to perform calculation then pass the data onto screen
            allLabel.text = allAmount;
            rentLabel.text = String(fetchBalance.calculateAmount(self.username, filteredRent, "Rent"));
            groceriesLabel.text = String(fetchBalance.calculateAmount(self.username, filteredGroceries, "Groceries"));
            transportLabel.text = String(fetchBalance.calculateAmount(self.username, filteredTransport, "Transport"));
            utilitiesLabel.text = String(fetchBalance.calculateAmount(self.username, filteredUtilities, "Utilities"));
            entertainmentLabel.text = String(fetchBalance.calculateAmount(self.username, filteredEntertainment, "Entertainment"));
            othersLabel.text = String(fetchBalance.calculateAmount(self.username, filteredOthers, "Others"));
        }
        catch {
            print("unable to calculate")
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        self.viewDidLoad();
    }
    
    @IBAction func allButton(_ sender: Any) {
        selectedCategory = "All";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func rentButton(_ sender: UIButton) {
        selectedCategory = "Rent";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func groceriesButton(_ sender: UIButton) {
        selectedCategory = "Groceries";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func transportButton(_ sender: UIButton) {
        selectedCategory = "Transport";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func utilitiesButton(_ sender: Any) {
        selectedCategory = "Utilities";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func entertainmentButton(_ sender: Any) {
        selectedCategory = "Entertainment";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func othersButton(_ sender: Any) {
        selectedCategory = "Others";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func backButton(_ sender: Any) {
        // perform segue programmatically and move to "dasboard"
        self.performSegue(withIdentifier: "returnToDash", sender: nil);
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTodisplayCategory" {
            // find the destination displayCategoryViewController and pass relevant data over
            if let destinationVC = segue.destination as? displayCategoryViewController {
                destinationVC.categoryTitle = selectedCategory;
                destinationVC.username = self.username;
            }
            
        }
        else if segue.identifier == "returnToDash" {
            // find the destination dashboardViewController and pass relevant data over
            if let destinationVC = segue.destination as? dashboardViewController {
                destinationVC.username = self.username;
            }
        }
    }
    
}
