//
//  ViewController.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIBarButtonItem!
    var dataModel: DataModel = DataModel()
    var allowEditing = false
    var selectedRow: Int?
    var bundleContainer: [String:Any] = [:]
    
    @IBAction func editButtonActionSelected(_ sender: UIBarButtonItem) {
        allowEditing = !allowEditing
        tableView.setEditing(allowEditing, animated: true)
        createButton.isEnabled = tableView.isEditing ? false : true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let avatar: Data? = UIImagePNGRepresentation(#imageLiteral(resourceName: "dummy_profile_pic_2"))
        //core data setup
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        
        //Core Data insertion to Core Data
//        let personCoreDataModel: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: "Person1", into: managedObjectContext)
//        personCoreDataModel.setValue("Julio", forKey: "firstName")
//        personCoreDataModel.setValue("Rodman", forKey: "lastName")
//        personCoreDataModel.setValue(avatar!, forKey: "avatar")
//        personCoreDataModel.setValue(23, forKey: "age")
//        personCoreDataModel.setValue("83 Neptune", forKey: "address")
//        personCoreDataModel.setValue("212-12-4322", forKey: "ssn")
//        personCoreDataModel.setValue(Occupation.engineer.rawValue, forKey: "occupation")
//        personCoreDataModel.setValue(EducationLevel.bachelors.rawValue, forKey: "educationDegree")
//
//        do {
//            try managedObjectContext.save()
//            print("Saved")
//        } catch {
//            print(error)
//        }
        
        
        //Core Data view/access info
//        print("fetchRequest")
//        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Person1")
//        do {
//            let results = try managedObjectContext.fetch(fetchRequest)
//            for eachResults in results as! [NSManagedObject] {
//                print(eachResults)
//                if let firstName = eachResults.value(forKey: "firstName") as? String {
//                    print(firstName)
//                }
//                if let lastName = eachResults.value(forKey: "lastName") as? String {
//                    print(lastName)
//                }
//            }
//        } catch {
//            print(error)
//        }

        //Core Data deletion
//        managedObjectContext.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let personTVCellNib: UINib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        tableView.register(personTVCellNib, forCellReuseIdentifier: "PersonTableViewCell")
    }
    
    @IBAction func unwindToListVC(segue: UIStoryboardSegue){
        print("unwindToListVC")
        let person = bundleContainer["person"] as! Person
        let indexPath = bundleContainer["indexPath"] as! IndexPath
        
        //update model and table with the new person
        dataModel.insert(person: person)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath] , with: .automatic)
        tableView.endUpdates()
        tableView.reloadData() //hmmmm, good practice?
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PersonDetailViewController {
            dest.bundleContainer["profileImage"] = dataModel.personContainer[selectedRow!].avatar
            dest.bundleContainer["firstName"] = dataModel.personContainer[selectedRow!].firstName
            dest.bundleContainer["lastName"] = dataModel.personContainer[selectedRow!].lastName
            dest.bundleContainer["age"] = String(dataModel.personContainer[selectedRow!].age)
            dest.bundleContainer["address"] = dataModel.personContainer[selectedRow!].address
            dest.bundleContainer["ssn"] = dataModel.personContainer[selectedRow!].SSN
            dest.bundleContainer["occupation"] = dataModel.personContainer[selectedRow!].occupation.rawValue
            dest.bundleContainer["education"] = dataModel.personContainer[selectedRow!].educationDegree.rawValue
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "segueToPersonDetailVC", sender: self)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.personContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //right place to put load the nib? is this even needed?
//        guard let cell: PersonTableViewCell = Bundle.main.loadNibNamed("PersonTableViewCell", owner: self, options: nil)?.first as? PersonTableViewCell else {
//            print("cellForRowAt load nib error")
//            print(Bundle.main.loadNibNamed("PersonTableViewCell", owner: self, options: nil)?.first)
//            return UITableViewCell()
//        }
        
        //have to use reusablecell or app will consume too much memory
        guard let reusableCell: PersonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell") as? PersonTableViewCell else {
            print("cellForRowAt dequeueReusableCell error")
            return UITableViewCell()
        }
        
        reusableCell.firstNameLabel.text = dataModel.personContainer[indexPath.row].firstName
        reusableCell.lastNameLabel.text = dataModel.personContainer[indexPath.row].lastName
        reusableCell.ageLabel.text = String(dataModel.personContainer[indexPath.row].age)
        reusableCell.profilePicOutlet.image = dataModel.personContainer[indexPath.row].avatar
        reusableCell.backgroundColor = indexPath.row%2 == 0 ? UIColor.green : UIColor.orange
//        print("cellForRowAt load nib good")
        
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        print("commit")
        //does insert need commit?
        if editingStyle == .delete {
            dataModel.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
}

