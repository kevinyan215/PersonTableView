//
//  ViewController.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var createButton: UIBarButtonItem!
    var dataModel: DataModel = DataModel()
    var allowEditing = false
    
    @IBAction func editButtonActionSelected(_ sender: UIBarButtonItem) {
        allowEditing = !allowEditing
        tableView.setEditing(allowEditing, animated: true)
        createButton.isEnabled = tableView.isEditing ? false : true
//        tableView.allowsMultipleSelectionDuringEditing = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        
        let personTVCellNib: UINib = UINib(nibName: "PersonTableViewCell", bundle: nil)
        tableView.register(personTVCellNib, forCellReuseIdentifier: "PersonTableViewCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToListVC(segue: UIStoryboardSegue){
        print("unwindToListVC")
//        reloadInputViews() //from UIResponder - refresh custom input view
//        tableView.reloadData()
    }
}

extension ListViewController: UITableViewDelegate {}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.personContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //right place to put load the nib? is this even needed? wtfffff
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

