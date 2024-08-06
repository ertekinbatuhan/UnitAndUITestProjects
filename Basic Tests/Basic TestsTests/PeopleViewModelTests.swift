//
//  Basic_TestsTests.swift
//  Basic TestsTests
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import XCTest
@testable import Basic_Tests

final class PeopleViewModelTests: XCTestCase {

    static let people = [
        Person(firstName: "Batuhan Berk", lastName: "Ertekin", age: 23, isWorking: false),
        Person(firstName: "Batuhan Berk", lastName: "Musk", age: 23, isWorking: false),
        Person(firstName: "Onur", lastName: "Solmaz", age: 20, isWorking: false),
        Person(firstName: "Cumali", lastName: "Gul", age: 19, isWorking: false),
        Person(firstName: "Mauro", lastName: "Icardi", age: 31, isWorking: true),
        Person(firstName: "Mauro", lastName: "Test", age: 21, isWorking: false),
        Person(firstName: "Mauro", lastName: "Wanda", age: 35, isWorking: true)
    ]
    
    func testFirstNameFilter() {
        
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = [{$0.firstName == "Mauro"}]
        
        let expectedResult = [
            Person(firstName: "Mauro", lastName: "Icardi", age: 31, isWorking: true),
           Person(firstName: "Mauro", lastName: "Test", age: 21, isWorking: false),
           Person(firstName: "Mauro", lastName: "Wanda", age: 35, isWorking: true)
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }
    
    func testEmptyList() {
        let peopleViewModel = PeopleViewModel(people: [])
        
        peopleViewModel.filters = [
            {$0.firstName == "Mauro"}
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, [])
    }
    
    func testAgeFilter() {
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = [
            {$0.age >= 30}
        ]
        
        let expectedResult = [
            Person(firstName: "Mauro", lastName: "Icardi", age: 31, isWorking: true),
            Person(firstName: "Mauro", lastName: "Wanda", age: 35, isWorking: true)
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }
    
    func testFilterOrder() {
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
      
        peopleViewModel.filters = [
            {$0.isWorking == true},
            {$0.firstName == "Mauro"}
        ]
        
        let expectedResult = [
            Person(firstName: "Mauro", lastName: "Icardi", age: 31, isWorking: true),
            Person(firstName: "Mauro", lastName: "Wanda", age: 35, isWorking: true)
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }
    
    func testFilterEmptyResults() {
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        
        peopleViewModel.filters = [
            {$0.firstName == "NonExistentName"}
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, [])
    }

    func testSingleFilter() {
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = [
            {$0.lastName == "Wanda"}
        ]
        
        let expectedResult = [
            Person(firstName: "Mauro", lastName: "Wanda", age: 35, isWorking: true)
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }

    
    func testMultipleFilters() {
        
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = [
            {$0.firstName == "Batuhan Berk"},
            {$0.isWorking == false},
            {$0.age == 23}
        ]
        
        let expectedResult = [
            Person(firstName: "Batuhan Berk", lastName: "Ertekin", age: 23, isWorking: false),
            Person(firstName: "Batuhan Berk", lastName: "Musk", age: 23, isWorking: false)
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }
    
    func testNoResults() {
        
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = [
            {$0.firstName == "Batuhan Berk"},
            {$0.isWorking == true},
            {$0.age == 23}
        ]
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, [])
    }
    
    func testNoFilters() {
        
        let peopleViewModel = PeopleViewModel(people: PeopleViewModelTests.people)
        
        peopleViewModel.filters = []
        
        let expectedResult = PeopleViewModelTests.people
        
        XCTAssertEqual(peopleViewModel.peoplemMatchingFilters, expectedResult)
    }

}
