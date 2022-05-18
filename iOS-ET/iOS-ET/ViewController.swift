//
//  ViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 14/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var feedBackTF: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true;
        
        // database
//        var container:
    }
    
    @IBAction func loginButton(_ sender: Any) {
        // check if the textfield is empty or not
        if ((validateTF(userNameTF.text ?? "")) == false && (validateTF(pwdTF.text ?? "")) == false) {
            feedBackTF.textColor = UIColor.systemYellow;
            feedBackTF.text = "Enter username and password";
            
        } else if (validateLogin(username: userNameTF.text ?? "", pwd: pwdTF.text ?? "")) == false {
            feedBackTF.textColor = UIColor.systemYellow;
            feedBackTF.text = "incorrect username or password";
        }
        else {
            // after validations are complete; perform segue programmatically
            // move to the dashboard when "sign in" button is clicked
            self.performSegue(withIdentifier: "loginToDashboard", sender: nil);
        }
        
    }
    
    // validate func to check whether textfield are empty
    func validateTF(_ textfield: String) -> Bool {
        if textfield.isEmpty {
            return false;
        }
        return true;
    }
    
    // validate func to check login details
    func validateLogin(username: String, pwd: String) -> Bool {
        if username != "hello" || pwd != "world" {
            return false;
        }
        return true;
    }
    
    // function to pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check whether it is the right segue
        if (segue.identifier == "loginToDashboard") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                dashboardViewController {
                
                destinationVC.username = userNameTF.text ?? "sample";
                destinationVC.pwd = userNameTF.text ?? "sample";
            }
        }
    }
    
}

