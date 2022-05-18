//
//  detailExpenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit

class displayCategoryViewController: UIViewController {
    @IBOutlet weak var detailTable: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    var amount: Double = 0.0
    var acountName: String = " "
    
    var categoryTitle: String = "Hello";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the nav bar
        self.navigationController?.isNavigationBarHidden = true;
        
        titleLable.text = categoryTitle;
    }
}
