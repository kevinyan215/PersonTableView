//
//  PersonDetailViewController.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/5/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

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
        profileImage.image = bundleContainer["profileImage"] as? UIImage
        firstNameLabel.text = bundleContainer["firstName"] as? String
        lastNameLabel.text = bundleContainer["lastName"] as? String
        ageLabel.text = bundleContainer["age"] as? String
        addressLabel.text = bundleContainer["address"] as? String
        ssnLabel.text = bundleContainer["ssn"] as? String
        occupationLabel.text = bundleContainer["occupation"] as? String
        educationLabel.text = bundleContainer["education"] as? String
    }
}
