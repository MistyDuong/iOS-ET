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
    
    var amount: Double = 0.0
    var acountName:String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the nav bar
        self.navigationController?.isNavigationBarHidden = true;
    }
}
