//
//  Person.swift
//  PersonTableView
//
//  Created by mobile consulting on 12/4/17.
//  Copyright © 2017 mobile consulting. All rights reserved.
//

import Foundation
import UIKit

enum Occupation: String {
    case doctor = "Doctor"
    case engineer = "Engineer"
    case artist = "Artist"
    case actor = "Actor"
    case manager = "Manager"
    case detective = "Detective"
    case nbaPlayer = "Nba Player"
    case unemployed = "Unemployed"
}

enum EducationLevel: String {
    case none = "N/A"
    case bachelors = "Bachelors"
    case masters = "Masters"
    case phd = "PhD"
}

class Person {
    var firstName: String, lastName: String, avatar: UIImage, age: Int, address: String, SSN: String, occupation: Occupation, educationDegree: EducationLevel
    
    init(firstName: String, lastName: String, avatar: UIImage = #imageLiteral(resourceName: "dummy_profile_pic_2") , age: Int, address: String, SSN: String, occupation: Occupation, education: EducationLevel){
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.age = age
        self.address = address
        self.SSN = SSN
        self.occupation = occupation
        self.educationDegree = education
    }
}
