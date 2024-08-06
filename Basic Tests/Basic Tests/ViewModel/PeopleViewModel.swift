//
//  PeopleViewModel.swift
//  Basic Tests
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import Foundation

class PeopleViewModel  {
    typealias PersonFilter = (Person) -> Bool
    
    var people : [Person] = []
    var filters : [PersonFilter] = []
    
    init(people : [Person] , filters : [PersonFilter] = []) {
        self.people = people
        self.filters = filters
    }
    
    var peoplemMatchingFilters : [Person] {
        
        var filteredPeople = people
        
        for filter in filters {
            filteredPeople = filteredPeople.filter(filter)
            
        }
        return filteredPeople
    }
}
