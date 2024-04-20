//
//  NetworkManager.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 20/04/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    //  To protect the class for being instantiated from outside the class.
    private init() { }
}

enum GHRouter {
    case followers(username: String, page: Int)
    
    var baseURL: URL {
        URL(string: "https://api.github.com/users/")!
    }
    
    var path: String {
        switch self {
        case .followers(let username, let page):
            return "\(username)/followers?per_page=100&page=\(page)"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .followers:
            return .get
        }
    }
}
