//
//  Balance+CoreDataClass.swift
//  iOS-ET
//
//  Created by Quy Dam on 18/5/2022.
//
//

import Foundation
import CoreData
import UIKit

@objc(Balance)
public class Balance: NSManagedObject {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    
}
