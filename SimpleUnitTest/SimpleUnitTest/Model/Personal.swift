//
//  Personal.swift
//  SimpleUnitTest
//
//  Created by Batuhan Berk Ertekin on 9.08.2024.
//

import Foundation

class Personal {
    
    let firstName : String
    let lastName : String
    
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var worker : [Personal] = []
    
    func addPersonal(personal : Personal) {
        
    worker.append(personal)
        
    }
    
    func validFirstName()  -> Bool {
        
        return firstName.count > 2
        
    }
    
    func validLastName() -> Bool {
        return lastName.count > 2
    }
    
}
