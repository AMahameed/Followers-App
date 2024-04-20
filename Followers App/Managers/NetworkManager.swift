//
//  NetworkManager.swift
//  Followers App
//
//  Created by Abdallah Mahameed on 20/04/2024.
//

import Foundation
import Alamofire
import OSLog

class NetworkManager {
    
    static let shared = NetworkManager()
    
    //  To protect the class for being instantiated from outside the class.
    private init() { }
    
    func getFollowers(for username: String) async throws -> [Follower]? {
        let response = await AF.request(GHRouter.followers(username: username))
            .validate()
            .serializingDecodable([Follower].self)
            .response
            
        switch response.result {
            
        case .success(let followers):
            Logger().info("followers has been fetched \n \(followers)")
            return followers
            
        case .failure( _):
            Logger().error("\(response.debugDescription)")
            return nil
        }
    }
}

enum GHRouter {
    case followers(username: String)
    
    var baseURL: URL {
        URL(string: "https://api.github.com/users/")!
    }
    
    var path: String {
        switch self {
        case .followers(let username):
            return "\(username)/followers"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .followers:
            return .get
        }
    }
}

extension GHRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appending(path: path)
        
        var request = URLRequest(url: url)
        
        request.method = httpMethod
        
        return request
    }
}
