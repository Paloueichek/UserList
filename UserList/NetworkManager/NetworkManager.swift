//
//  NetworkManager.swift
//  UserList
//
//  Created by Patrick Aloueichek on 9/17/19.
//  Copyright © 2019 Patrick Aloueichek. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkManager: class {
    func getUsers(completion: @escaping(Result<Users, Error>) -> Void)
    func getPosts(for user: User,completion: @escaping(Result<Posts, Error>) -> Void)
}

final class NetworkManagerImp: NetworkManager {
    
    
    func fetch<T: Decodable>(request: URLRequest, completion: @escaping(Result<T, Error>) -> Void) {
        let session = URLSession.shared.dataTask(with: request) { (data,_ ,error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let getUsers = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(getUsers))
                }
            } catch let err {
                completion(.failure(err))
            }
        }
        session.resume()
    }
    
      func getUsers(completion: @escaping(Result<Users, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        fetch(request: request, completion: completion)
    }
    
    func getPosts(for user: User,completion: @escaping(Result<Posts, Error>) -> Void) {
        
        let urlString = "https://jsonplaceholder.typicode.com/posts?userId=\(user.id)"
        print("\(user.id)")
        guard let url = URL(string: urlString) else { return }
              let request = URLRequest(url: url)
        fetch(request: request, completion: completion)
    }
}

