//
//  UserViewModelProtocol.swift
//  Json
//
//  Created by Batuhan Berk Ertekin on 7.08.2024.
//

import Foundation

protocol UserViewModelProtocol : AnyObject {
    func updateView(name : String, userName : String , email : String) 
}
