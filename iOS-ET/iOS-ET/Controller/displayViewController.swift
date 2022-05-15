//
//  displayViewController.swift
//  iOS-ET
//
//  Created by Misty Duong on 15/5/22.
//

import Foundation
import UIKit

class displayViewController: UIViewController {
    
    var username: String = "sample";
    var pwd: String = "sample";

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true;
    }


}
