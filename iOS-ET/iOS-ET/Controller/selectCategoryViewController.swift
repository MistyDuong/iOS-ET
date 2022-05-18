//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit


class selectCategoryViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var rentLabel: UILabel!
    @IBOutlet weak var groceriesLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var utilitiesLabel: UILabel!
    @IBOutlet weak var entertainmentLabel: UILabel!
    
    var selectedCategory: String = "name";

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier=="goTodisplayCategory" {
        let VC=segue.destination as! displayCategoryViewController
        
        VC.categoryTitle = selectedCategory;
        
        // pass username
        // filter category
        }
    }
    
}
