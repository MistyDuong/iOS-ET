//
//  expenseDisplayViewController.swift
//  iOS-ET
//
//  Created by Quy Dam on 17/5/2022.
//

import Foundation
import UIKit


class selectCategoryViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var rentLabel: UILabel!
    @IBOutlet weak var groceriesLabel: UILabel!
    @IBOutlet weak var transportLabel: UILabel!
    @IBOutlet weak var utilitiesLabel: UILabel!
    @IBOutlet weak var entertainmentLabel: UILabel!
    @IBOutlet weak var othersLabel: UIButton!
    
    @IBAction func rentButton(_ sender: UIButton) {
    }
    @IBAction func groceriesButton(_ sender: UIButton) {
    }
    @IBAction func transportButton(_ sender: UIButton) {
    }
    @IBAction func utilitiesButton(_ sender: Any) {
    }
    @IBAction func entertainmentButton(_ sender: Any) {
    }
    @IBAction func othersButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier=="START"{
        let VC=segue.destination as! displayCategoryViewController
        /*
        VC.currentPlayerName=String(playerName.text!)
        VC.remainingTime=Int(timeSlider.value)
        VC.maxBubble=Int(maxBubbleSlider.value)
        */
    }
}
    
}
