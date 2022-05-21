//
//  registerViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 14/5/22.
//

import Foundation
import UIKit
import CoreData

class registerViewController: UIViewController {
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var incomeTF: UITextField!
    @IBOutlet weak var expenseTF: UITextField!
    @IBOutlet weak var feedBackTF: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide nav bar
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    func fetchUser() {
        // retrieve the data from core data
        do {
            users = try context.fetch(User.fetchRequest());
        } catch {
            print("unable to fetch user")
        }
    }
    
    @IBAction func createButton(_ sender: Any) {
        // perform validation if it is empty, existing name and correct data type input
        if ((validateTF(firstNameTF.text ?? "") == false) || (validateTF(lastNameTF.text ?? "") == false) || (validateTF(userNameTF.text ?? "") == false) || (validateTF(pwdTF.text ?? "") == false) || (validateTF(incomeTF.text ?? "") == false) || (validateTF(expenseTF.text ?? "") == false)) {
            feedBackTF.text = "provide all the required details";
        } else if (validateExistingName(userNameTF.text ?? "") == false) {
            feedBackTF.text = "username already existed";
        }
        else if validateInt(incomeTF.text ?? "") == false || validateInt(expenseTF.text ?? "") == false {
            feedBackTF.text = "number field can't have string";
        }
        else {
            // add registered user data to database
            // since the validations above ensure that all textfields will not be empty
            // force unwrap can be used to resolve the optional variable
            let newUser = User(context: self.context);
            newUser.addUser(firstName: firstNameTF.text!, lastName: lastNameTF.text!, userName: userNameTF.text!, pwd: pwdTF.text!, monthlyIncome: Double(incomeTF.text!)!, spendingLimit: Double(expenseTF.text!)!)
            
            // perform segue programmatically
            // move to the dashboard when "sign in" button is clicked
            self.performSegue(withIdentifier: "registerToDashboard", sender: nil);
        }
    }
    
    // validate func to check whether textfield are empty
    func validateTF(_ textfield: String) -> Bool {
        if textfield.isEmpty {
            return false;
        }
        return true;
    }
    
    // validate func to check existing username
    func validateExistingName(_ username: String) -> Bool {
        let user = User(context: self.context);
        if user.validateExisting(userNameTF.text!) == true {
            return false;
        }
        return true;
    }
    
    // validate func to check that number field only consist number
    func validateInt(_ number: String) -> Bool {
        return number.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil;
    }
    
    // function to pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check whether it is the right segue
        if (segue.identifier == "registerToDashboard") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                dashboardViewController {
                destinationVC.username = userNameTF.text!;
            }
        }
    }


}
