//
//  RootViewModel.swift
//  Authentication
//
//  Created by Batuhan Berk Ertekin on 8.08.2024.
//

import Foundation

class RootViewModel {
    
    private let loginService : LoginService
    
    weak var output : RootViewModelOutput?
    
    init(loginService: LoginService, output: RootViewModelOutput? = nil) {
        self.loginService = loginService
    }

    func checkLogin() {
        
        if let accessToken = loginService.getUserAccessToken(), !accessToken.isEmpty {
            
            output?.showMain()
        } else {
        
            output?.showLogin()
        }
        
    }
    
}
