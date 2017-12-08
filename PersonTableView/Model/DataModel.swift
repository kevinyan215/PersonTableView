//
//  DataModel.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation

class DataModel {
    var personContainer: [Person] = []
    let coreDataManager = CoreDataManager()
    
    init(){
        var person1 = Person(firstName: "Jimmy", lastName: "Butler", avatar: #imageLiteral(resourceName: "dummy_profile_pic_1"), age: 27, address: "33 Vancouver Blvd", SSN: "152-23-3212", occupation: .nbaPlayer, education: .bachelors)
        var person2 = Person(firstName: "Ryan", lastName: "Anderson", avatar: #imageLiteral(resourceName: "dummy_profile_pic_2"), age: 29, address: "11 Tutor Dr", SSN: "362-35-7543", occupation: .nbaPlayer, education: .masters)
        var person3 = Person(firstName: "Alexander", lastName: "Cho", avatar: #imageLiteral(resourceName: "dummy_profile_pic_3"), age: 54, address: "81 Aster St", SSN: "832-56-8647", occupation: .doctor, education: .phd)
        var person4 = Person(firstName: "Alexa", lastName: "Kentavious", avatar: #imageLiteral(resourceName: "dummy_profile_pic_4") , age: 47, address: "137 Kexi", SSN: "553-35-7645", occupation: .artist, education: .bachelors)
        var person5 = Person(firstName: "Mary", lastName: "leai", avatar: #imageLiteral(resourceName: "dummy_profile_pic_5"), age: 68, address: "49 Reia", SSN: "334-43-2654", occupation: .detective, education: .none)
        var person6 = Person(firstName: "Ashton", lastName: "Kutcher", age: 56, address: "21 Hollywood Blvd", SSN: "322-45-4542", occupation: .actor, education: .masters)
        
//        insert(person: person1)
//        insert(person: person2)
//        insert(person: person3)
//        insert(person: person4)
//        insert(person: person5)
//        insert(person: person6)
        
//        coreDataManager.insertToPersonEntity(person: person1)
//        coreDataManager.insertToPersonEntity(person: person2)
//        coreDataManager.insertToPersonEntity(person: person3)
//        coreDataManager.insertToPersonEntity(person: person4)
//        coreDataManager.insertToPersonEntity(person: person5)
//        coreDataManager.insertToPersonEntity(person: person6)

//        coreDataManager.deleteFromPersonEntity(person: person1)
//        coreDataManager.clearPersonEntity()
        personContainer = coreDataManager.getPersonList()
//        print(CoreDataManager().getPersonList())
    }
    
    func insert(person: Person){
        personContainer.append(person)
    }
    
    func remove(at: Int){
        personContainer.remove(at: at)
    }
    
    func clear() {
        personContainer = []
    }
    
    func reloadData() {
        personContainer = CoreDataManager().getPersonList()
    }
}
