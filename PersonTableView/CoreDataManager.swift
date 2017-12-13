//
//  CoreDataManager.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/8/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    func test() {
//        NSFetchRequestResul
    }
    func getManagedObjectContext() -> NSManagedObjectContext {
        //core data setup
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        return managedObjectContext
    }
    //firstName: String, lastName: String, age: Int, address: String, ssn: String, occupation: String, education: String
    func insertToPersonEntity(person: Person) {
        let avatar: Data? = UIImagePNGRepresentation(#imageLiteral(resourceName: "dummy_profile_pic_2"))
        print(avatar!)
        
        //Core Data insertion to Core Data
        let personCoreDataModel: NSManagedObject = NSEntityDescription.insertNewObject(forEntityName: CoreDataKeys.Entity.person, into: getManagedObjectContext())
        personCoreDataModel.setValue(person.firstName, forKey: CoreDataKeys.Person.firstName)
        personCoreDataModel.setValue(person.lastName, forKey: CoreDataKeys.Person.lastName)
        personCoreDataModel.setValue(avatar!, forKey: CoreDataKeys.Person.avatar)
        personCoreDataModel.setValue(person.age, forKey: CoreDataKeys.Person.age)
        personCoreDataModel.setValue(person.address, forKey: CoreDataKeys.Person.address)
        personCoreDataModel.setValue(person.SSN, forKey: CoreDataKeys.Person.ssn)
        personCoreDataModel.setValue(person.occupation.rawValue, forKey: CoreDataKeys.Person.occupation)
        personCoreDataModel.setValue(person.educationDegree.rawValue, forKey: CoreDataKeys.Person.education)
        
        do {
            try getManagedObjectContext().save()
//            print("Saved")
        } catch {
            print(error)
        }
    }
    
    func clearPersonEntity() {
        //fetch request -> returns NSManagedObject -> use NSManagedObjectContext to delete said object
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataKeys.Entity.person)
        
        do {
            if let results = try getManagedObjectContext().fetch(fetchRequest) as? [NSManagedObject] {
                for object in results {
                    getManagedObjectContext().delete(object)
                }
            }
             try getManagedObjectContext().save()
        } catch{
            //error handling
        }
    }
    
    func deleteFromPersonEntity(person: Person) {
        //fetch request -> returns NSManagedObject -> use NSManagedObjectContext to delete said object
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataKeys.Entity.person)
        let subPredicate1 = NSPredicate(format: "firstName == %@", person.firstName)
        let subPredicate2 = NSPredicate(format: "lastName == %@", person.lastName)
        let subPredicate3 = NSPredicate(format: "age == %i", person.age)
        let subPredicate4 = NSPredicate(format: "ssn == %@", person.SSN)
   
        let predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and, subpredicates: [subPredicate1,subPredicate2,subPredicate3,subPredicate4])
        fetchRequest.predicate = predicate
        
        do {
            if let results = try getManagedObjectContext().fetch(fetchRequest) as? [NSManagedObject] {
                for object in results {
                    getManagedObjectContext().delete(object)
                }
            }
            try getManagedObjectContext().save()
        } catch{
            //error handling
        }
    }
    
    func getPersonList() -> [Person] {
        var arr: [Person] = []

        //Core Data view/access info
        print("fetchRequest")
        let fetchRequest: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: CoreDataKeys.Entity.person)
        do {
            let results = try getManagedObjectContext().fetch(fetchRequest)
            for eachResults in results as! [NSManagedObject] {
                print(eachResults)
                guard
                    let firstName = eachResults.value(forKey: CoreDataKeys.Person.firstName) as? String,
                    let lastName = eachResults.value(forKey: CoreDataKeys.Person.lastName) as? String,
                    //                    let data = eachResults.value(forKey: "avatar") as? Data,
                    //                    let avatar = UIImage(data: data),
                    let age = eachResults.value(forKey: CoreDataKeys.Person.age) as? Int,
                    let address = eachResults.value(forKey: CoreDataKeys.Person.address) as? String,
                    let ssn = eachResults.value(forKey: CoreDataKeys.Person.ssn) as? String,
                    let occupation = eachResults.value(forKey: CoreDataKeys.Person.occupation) as? String,
                    let educationDegree = eachResults.value(forKey: CoreDataKeys.Person.education) as? String
                    else {
                        print("guard else")
                        continue
                }

                let person = Person(firstName: firstName, lastName: lastName, age: age, address: address, SSN: ssn)
                arr.append(person)
//                print(person)
            }
        } catch {
            print(error)
        }
        return arr
    }
}
