//
//  PersonDetailViewController.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

//let person = Person(firstName: firstName, lastName: lastName, age: age!, address: address, SSN: ssn, occupation: .unemployed, education: .none)

class PersonDetailViewController: UIViewController {
    var bundleContainer: [String: Any] = [:]
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ssnLabel: UILabel!
    @IBOutlet weak var occupationLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    
    override func viewDidLoad() {
        profileImage.image = bundleContainer["profileImage"] as? UIImage //hardcoded image
        firstNameLabel.text = bundleContainer["firstName"] as? String
        lastNameLabel.text = bundleContainer["lastName"] as? String
        ageLabel.text = bundleContainer["age"] as? String
        addressLabel.text = bundleContainer["address"] as? String
        ssnLabel.text = bundleContainer["ssn"] as? String
        occupationLabel.text = bundleContainer["occupation"] as? String
        educationLabel.text = bundleContainer["education"] as? String
        
        
        //
        
//        firstNameLabel.text = "First Name: \(bundleContainer["firstName"])"
//        lastNameLabel.text = "Last Name: \(bundleContainer["lastName"])"
//        ageLabel.text = "Age: \(bundleContainer["age"])"
//        addressLabel.text = "Address: \(bundleContainer["address"])"
//        ssnLabel.text = bundleContainer["ssn"]
//        occupationLabel.text = bundleContainer["occupation"]
//        educationLabel.text = bundleContainer["education"]
    }
}
