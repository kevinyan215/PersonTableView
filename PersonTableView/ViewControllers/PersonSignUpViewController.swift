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
        let firstName: String = firstNameLabel.text!, lastName = lastNameLabel.text!, age: Int? = Int(ageLabel.text!), address = addressLabel.text!, ssn = ssnLabel.text!, occupation = occupationLabel.text!, education = educationLabel.text!
        
        //Optional(Int) is Int, Optional(3) == 3
        guard firstName != "", lastName != "", age is Int, address != "", ssn != "", occupation != "", education != "" else {
            print("missing input somewhere or invalid age")
            return
        }
        performSegue(withIdentifier: "unwindToListVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare for segue")
        let firstName: String = firstNameLabel.text!, lastName = lastNameLabel.text!, age: Int? = Int(ageLabel.text!), address = addressLabel.text!, ssn = ssnLabel.text!, occupation = occupationLabel.text!, education = educationLabel.text!
        let person = Person(firstName: firstName, lastName: lastName, age: age!, address: address, SSN: ssn, occupation: .engineer, education: .masters)
        
        if let dest = segue.destination as? ListViewController {
            print("prepare for segue - dest = ListVC")
            //update data model and insert item onto table
           
            //updating destination VC model and table here... hmmm..
//            dest.dataModel.insert(person: person)
//            dest.tableView.beginUpdates()
//            let indexPath = IndexPath(row: dest.dataModel.personContainer.count-1, section: 0)
//            dest.tableView.insertRows(at: [indexPath] , with: .automatic)
//            dest.tableView.endUpdates()
            
            let indexPath = IndexPath(row: dest.dataModel.personContainer.count-1, section: 0)
            dest.bundleContainer["person"] = person
            dest.bundleContainer["indexPath"] = indexPath
        }
    }
}


//alternative way.. @ when submit button pressed
//manually pop from navController.. but how to pass data back to destination controller?
//        if let navController = navigationController {
//            print("pop top view from nav controller")
//            navController.popViewController(animated: true)
//        }


//prepareForSegue checks
//        print("""
//            firstNameLabel: \(firstNameLabel.background) ,
//            lastNameLabel: \(lastNameLabel.text) ,
//            ageLabel: \(ageLabel.text) ,
//            educationLabel: \(educationLabel.text) ,
//            occupationLabel: \(occupationLabel.text) ,
//            ssnLabel: \(ssnLabel.text) ,
//            addressLabel: \(addressLabel.text)
//        """)
