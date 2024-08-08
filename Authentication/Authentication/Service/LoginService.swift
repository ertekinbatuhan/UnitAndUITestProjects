//
//  LoginService.swift
//  Authentication
//
//  Created by Batuhan Berk Ertekin on 8.08.2024.
//

import Foundation

protocol LoginService {
    
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token : String)
    func getUserAccessToken() -> String?
    
}
