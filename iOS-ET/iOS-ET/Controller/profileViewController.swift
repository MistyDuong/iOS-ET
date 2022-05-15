//
//  profileViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit

class profileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    
    @IBAction func editButton(_ sender: Any) {
        // after validations are complete; perform segue programmatically
        // move to the dashboard when "sign in" button is clicked
        self.performSegue(withIdentifier: "goToUpdateProfile", sender: nil);
    }
    
    // function to pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check whether it is the right segue
        if (segue.identifier == "goToUpdateProfile") {
            // find the destination viewController - gameViewController
            if let destinationVC = segue.destination as?
                dashboardViewController {
                
                
            }
        }
    }

}
