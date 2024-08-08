//
//  LoginServiceImpl.swift
//  Authentication
//
//  Created by Batuhan Berk Ertekin on 8.08.2024.
//

import Foundation

class LoginServiceImpl : LoginService {
    
    let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.setValue(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
