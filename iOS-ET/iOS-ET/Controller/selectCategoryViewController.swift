//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit


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

    override func viewDidLoad() {
        super.viewDidLoad();
        // hide nav bar
        self.navigationController?.isNavigationBarHidden = true;
        print("select category - \(username)");
    }
    
    
    @IBAction func allButton(_ sender: Any) {
        
        selectedCategory = "All";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func rentButton(_ sender: UIButton) {
        selectedCategory = "Rent";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func groceriesButton(_ sender: UIButton) {
        selectedCategory = "Groceries";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func transportButton(_ sender: UIButton) {
        selectedCategory = "Transportation";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func utilitiesButton(_ sender: Any) {
        selectedCategory = "Utilities";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func entertainmentButton(_ sender: Any) {
        selectedCategory = "Entertainment";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func othersButton(_ sender: Any) {
        selectedCategory = "Others";
        
        // perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func backButton(_ sender: Any) {
        // perform segue programmatically
        self.performSegue(withIdentifier: "returnToDash", sender: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goTodisplayCategory" {
            let destinationVC = segue.destination as! displayCategoryViewController
            destinationVC.categoryTitle = selectedCategory;
            destinationVC.username = self.username;
        }
        else if segue.identifier == "returnToDash" {
            let destinationVC = segue.destination as! dashboardViewController
            destinationVC.username = self.username;
        }
    }
    
}
