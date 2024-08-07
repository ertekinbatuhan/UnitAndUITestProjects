//
//  UserViewModel.swift
//  Json
//
//  Created by Batuhan Berk Ertekin on 7.08.2024.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService

    weak var viewModelProtocol : UserViewModelProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers(){
        
        userService.fetchUser { [weak self] result in
            switch result {
            case.success(let user):
                self?.viewModelProtocol?.updateView(name: user.name, userName: user.username, email: user.email)
            case.failure(_):
                self?.viewModelProtocol?.updateView(name: "No user", userName: "", email: "")
            }
        }
    }
    
    
}
