//
//  BackendAPI.swift
//  News
//
//  Created by Raman Krutsiou on 5/27/21.
//
import Foundation
import Alamofire
import Moya

enum NetworkService {
    case getBusinessNews(dataForServer:APIKey)
    case getEntertainmentNews(dataForServer:APIKey)
    case getGeneralNews(dataForServer:APIKey)
    case getHealthNews(dataForServer:APIKey)
    case getScienceNews(dataForServer:APIKey)
    case getSportsNews(dataForServer:APIKey)
    case getTechnologyNews(dataForServer:APIKey)
    
}
extension NetworkService : TargetType{
    var headers: [String : String]? {
        return nil
    }
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string:"https://newsapi.org")!
        }
    }
    
    var path: String {
        switch self {
        default:
            return "/v2/top-headlines"
        }
    }
    
    var method: Moya.Method {
        return.get
        
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        default:
            guard let params = parametrs else {
                return .requestPlain
            }
        return .requestParameters (parameters:params, encoding:parametrEncoding)
    }
    }
    
    var parametrs:[String:Any]? {
        var parametrs = [String:Any]()
        switch self {
        case .getBusinessNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "business"
        case .getEntertainmentNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "entertainment"
        case .getGeneralNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "general"
        case .getHealthNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "health"
        case .getScienceNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "science"
        case.getSportsNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "sports"
        case .getTechnologyNews(let dataForServer):
            parametrs["country"] = dataForServer.countryRequest
            parametrs["apiKey"] = dataForServer.apiKey
            parametrs["category"] = "technology"
        default:
            break
        }
        return parametrs
    }
    
    var parametrEncoding : ParameterEncoding{
        switch self {
        default:
            return URLEncoding.queryString
        }
    }
    
    
    }
