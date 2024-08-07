//
//  UserService.swift
//  Json
//
//  Created by Batuhan Berk Ertekin on 7.08.2024.
//

import Foundation

protocol UserService {
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
}
