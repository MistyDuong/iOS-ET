//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit


class expenseDisplayViewController: UIViewController, UITextFieldDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier=="START"{
        let VC=segue.destination as! detailExpenseDisplayController
        /*
        VC.currentPlayerName=String(playerName.text!)
        VC.remainingTime=Int(timeSlider.value)
        VC.maxBubble=Int(maxBubbleSlider.value)
        */
    }
}
    
}
