//
//  PersonSignUpViewController.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

class PersonSignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var educationLabel: UITextField!
    @IBOutlet weak var occupationLabel: UITextField!
    @IBOutlet weak var ssnLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    
    @IBAction func submitSignUpAction(_ sender: UIBarButtonItem) {
        print("submit action")
        //optional values are diff from value values, have to unwrap optionals if want to compare
        
        let firstName: String = firstNameLabel.text!
        let lastName = lastNameLabel.text!
        var age: Int? = Int(ageLabel.text!)
        let address = addressLabel.text!
        let ssn = ssnLabel.text!
        let occupation = occupationLabel.text!
        let education = educationLabel.text!
        
        //Optional(Int) is Int, Optional(3) == 3
        guard firstName != "", lastName != "", age is Int, address != "", ssn != "", occupation != "", education != "" else {
            print("missing input somewhere orrrr invalid age")
            return
        }
        
        performSegue(withIdentifier: "unwindToListVC", sender: nil)
        
        //alternative way..
        //manually pop from navController.. but how to pass data back to destination controller?
//        if let navController = navigationController {
//            print("pop top view from nav controller")
//            navController.popViewController(animated: true)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        ////put info onto datamodel in VC
        print("prepare for segue")
        
//        print("""
//            firstNameLabel: \(firstNameLabel.background) ,
//            lastNameLabel: \(lastNameLabel.text) ,
//            ageLabel: \(ageLabel.text) ,
//            educationLabel: \(educationLabel.text) ,
//            occupationLabel: \(occupationLabel.text) ,
//            ssnLabel: \(ssnLabel.text) ,
//            addressLabel: \(addressLabel.text)
//        """)
        
        let firstName: String = firstNameLabel.text!
        let lastName = lastNameLabel.text!
        var age: Int? = Int(ageLabel.text!)
        let address = addressLabel.text!
        let ssn = ssnLabel.text!
        let occupation = occupationLabel.text!
        let education = educationLabel.text!
        
        
        let person = Person(firstName: firstName, lastName: lastName, age: age!, address: address, SSN: ssn, occupation: .unemployed, education: .none)
        
        if let dest = segue.destination as? ListViewController {
            print("prepare for segue - sender = ListVC")
            dest.dataModel.insert(person: person)
        }
    }
    
    
}
