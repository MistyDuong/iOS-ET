//
//  profileViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit

class profileViewController: UIViewController {
    @IBOutlet weak var limitLabel: UILabel!
    @IBOutlet weak var pwdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    @IBAction func limitButton(_ sender: Any) {
        // create alert
        let alert = UIAlertController(title: "Update Spending Limit", message: "New spending Limit: ", preferredStyle: .alert)
        alert.addTextField();
        
        let textfield = alert.textFields![0];
        textfield.text = limitLabel.text;
        
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            // action
        }
        
        // add button
        alert.addAction(saveButton);
        
        // show alert
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func pwdButton(_ sender: Any) {
        let alert = UIAlertController(title: "Update password", message: "New password: ", preferredStyle: .alert)
        alert.addTextField();
        
        let textfield = alert.textFields![0];
        textfield.text = pwdLabel.text;
        
        // configure the handler
        let saveButton = UIAlertAction(title: "Save", style: .default) { (action) in
            // action
        }
        
        // add button
        alert.addAction(saveButton);
        
        // show alert
        self.present(alert, animated: true, completion: nil);
    }

}
