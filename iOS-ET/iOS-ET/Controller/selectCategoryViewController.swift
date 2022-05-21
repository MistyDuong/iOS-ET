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
    
    var allAmount: Double = 0;
    var rentAmount: Double = 0;
    var groceriesAmount: Double = 0;
    var transportAmount: Double = 0;
    var utilitiesAmount: Double = 0;
    var entertainmentAmount: Double = 0;
    var othersAmount: Double = 0;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        // hide navbar
        self.navigationController?.isNavigationBarHidden = true;
        
        calculateAmount()
    }
    
    
    
    func calculateAmount(){
        do{
        let balance = Balance(context: self.context);
        let request = balance.fetchBalance(username)
        let result = try context.fetch(request);

        for item in result as [NSManagedObject]{
            let itemCategory=item.value(forKey: "category") as? String
            let itemType=item.value(forKey: "type") as? String
            
            if(itemCategory=="Rent"){
                if(itemType=="Income"){
                    rentAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    rentAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }else if(itemCategory=="Groceries"){
                if(itemType=="Income"){
                    groceriesAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    groceriesAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }else if(itemCategory=="Transport"){
                if(itemType=="Income"){
                    transportAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    transportAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }else if(itemCategory=="Utilities"){
                if(itemType=="Income"){
                    utilitiesAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    utilitiesAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }else if(itemCategory=="Entertainment"){
                if(itemType=="Income"){
                    entertainmentAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    entertainmentAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }else{
                if(itemType=="Income"){
                    othersAmount+=Double(item.value(forKey: "amount") as! NSNumber)
                }else{
                    othersAmount-=Double(item.value(forKey: "amount") as! NSNumber)
                }
            }
            if(itemType=="Income"){
                allAmount+=Double(item.value(forKey: "amount") as! NSNumber)
            }else{
                allAmount-=Double(item.value(forKey: "amount") as! NSNumber)
            }
        }
            allLabel.text=String(allAmount) + "$"
            rentLabel.text=String(rentAmount) + "$"
            groceriesLabel.text=String(groceriesAmount) + "$"
            transportLabel.text=String(transportAmount) + "$"
            utilitiesLabel.text=String(utilitiesAmount) + "$"
            entertainmentLabel.text=String(entertainmentAmount) + "$"
            othersLabel.text=String(othersAmount) + "$"
        }catch{
            print("error")
        }
    }
    
    @IBAction func allButton(_ sender: UIButton) {
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
    
    @IBAction func utilitiesButton(_ sender: UIButton) {
        selectedCategory = "Utilities";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func entertainmentButton(_ sender: UIButton) {
        selectedCategory = "Entertainment";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func othersButton(_ sender: UIButton) {
        selectedCategory = "Others";
        
        // perform segue programmatically and move to "displaycategory"
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func backButton(_ sender: UIButton) {
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
