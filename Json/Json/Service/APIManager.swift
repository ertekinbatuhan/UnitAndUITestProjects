//
//  APIManager.swift
//  Json
//
//  Created by Batuhan Berk Ertekin on 6.08.2024.
//

import Foundation

class APIManager  : UserService {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void){
        
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data   else {return}
            
            DispatchQueue.main.async {
                
                if let user =  try? JSONDecoder().decode([User].self, from: data).first {
                    completion(.success(user))
                    
                } else {
                    completion(.failure(NSError()))
                }
                
                
            }
            
        }.resume()

    }
}

