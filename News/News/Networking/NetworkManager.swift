//
//  NetworkManager.swift
//  News
//
//  Created by Raman Krutsiou on 5/27/21.
//

import Foundation
import Foundation
import Moya
import Moya_ObjectMapper

final class NetworkManager {
    private let provider = MoyaProvider<NetworkService>(plugins: [NetworkLoggerPlugin()])
    private init() {}
    
    static let shared = NetworkManager()
    
       func getBusinessNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
            provider.request(.getBusinessNews(dataForServer:data)) { (result) in
               switch result {
               case let.success(response):
                   print()
                   guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                       return
               }
                   completion(news)
               case let .failure(error):
                   print(error)
           }
       }
   }
    
    func getEntertainmentNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
         provider.request(.getEntertainmentNews(dataForServer:data)) { (result) in
            switch result {
            case let.success(response):
                print()
                guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                    return
            }
                completion(news)
            case let .failure(error):
                print(error)
        }
    }
}
 
    func getGeneralNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
         provider.request(.getGeneralNews(dataForServer:data)) { (result) in
            switch result {
            case let.success(response):
                print()
                guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                    return
            }
                completion(news)
            case let .failure(error):
                print(error)
        }
    }
}
    func getHealthNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
         provider.request(.getHealthNews(dataForServer:data)) { (result) in
            switch result {
            case let.success(response):
                print()
                guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                    return
            }
                completion(news)
            case let .failure(error):
                print(error)
        }
    }
}
    
    func getScienceNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
         provider.request(.getScienceNews(dataForServer:data)) { (result) in
            switch result {
            case let.success(response):
                print()
                guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                    return
            }
                completion(news)
            case let .failure(error):
                print(error)
        }
    }
}
    
    func getSportsNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
         provider.request(.getSportsNews(dataForServer:data)) { (result) in
            switch result {
            case let.success(response):
                print()
                guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                    return
            }
                completion(news)
            case let .failure(error):
                print(error)
        }
    }
}
    func getTechnologyNews (data:APIKey,completion: @escaping (ServerResponse) -> Void, failure: @escaping (String) -> Void) {
        provider.request(.getTechnologyNews(dataForServer:data)) { (result) in
           switch result {
           case let.success(response):
               guard let news = try? response.mapObject(ServerResponse.self) else {failure("Unknown")
                   return
           }
               completion(news)
           case let .failure(error):
               print(error)
       }
   }
    
}
}
