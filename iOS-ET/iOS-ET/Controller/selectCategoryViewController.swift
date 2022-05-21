//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//


import Foundation
import UIKit
import CoreData


class selectCategoryViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var allLabel: UILabel!
    @IBOutlet weak var rentLabel: UILabel!
    @IBOutlet weak var groceriesLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var utilitiesLabel: UILabel!
    @IBOutlet weak var entertainmentLabel: UILabel!
    @IBOutlet weak var othersLabel: UILabel!
    var balance:[Balance]?
    let context=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;

    var selectedCategory: String = "";
    //var name:String = ""
    var allAmount:Double=0
    var rentAmount:Double=0
    var groceriesAmount:Double=0
    var transportAmount:Double=0
    var utilitiesAmount:Double=0
    var entertainmentAmount:Double=0
    var othersAmount:Double=0

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBalance()
        calculateAmount()
    }
    
    func fetchBalance(){
        do{
            let request = Balance.fetchRequest() as NSFetchRequest<Balance>
            self.balance = try context.fetch(request)
            
        }catch{
            
        }
        DispatchQueue.main.async {
            
        }
    }
    
    func calculateAmount(){
        for item in balance!{
            
            if(item.category=="Rent"){
                rentAmount+=item.amount
            }
            if(item.category=="Groceries"){
                groceriesAmount+=item.amount
            }
            if(item.category=="Transport"){
                transportAmount+=item.amount
            }
            if(item.category=="Utilities"){
                utilitiesAmount+=item.amount
            }
            if(item.category=="Entertainment"){
                entertainmentAmount+=item.amount
            }
            if(item.category=="Others"){
                othersAmount+=item.amount
            }
            allAmount+=item.amount
            rentLabel.text=String(rentAmount)
            groceriesLabel.text=String(groceriesAmount)
            transportLabel.text=String(transportAmount)
            utilitiesLabel.text=String(utilitiesAmount)
            entertainmentLabel.text=String(entertainmentAmount)
            othersLabel.text=String(othersAmount)
        }
        
    }
    
    @IBAction func allButton(_ sender: UIButton) {
        selectedCategory = "All";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func rentButton(_ sender: UIButton) {
        selectedCategory = "Rent";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func groceriesButton(_ sender: UIButton) {
        selectedCategory = "Groceries";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func transportButton(_ sender: UIButton) {
        selectedCategory = "Transportation";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func utilitiesButton(_ sender: UIButton) {
        selectedCategory = "Utilities";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func entertainmentButton(_ sender: UIButton) {
        selectedCategory = "Entertainment";
        self.performSegue(withIdentifier: "goTodisplayCategory", sender: nil);
    }
    
    @IBAction func othersButton(_ sender: UIButton) {
        selectedCategory = "Others";
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
