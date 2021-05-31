//
//  ObjectMapping.swift
//  News
//
//  Created by Raman Krutsiou on 5/27/21.
//

import Foundation
import ObjectMapper

class ServerResponse:Mappable{
    
    var status:String?
    var totalRequest:Int?
    var data : [MainData] = []
    
   
    
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        status            <- map["status"]
        totalRequest      <- map["totalResults"]
        data              <- map["articles"]
       
    
    }
}

class MainData : Mappable {
    
    var author : String!
    var title : String!
    var description : String!
    var url : String?
    var urlToImage : String?
    var source : Source!
    var date: String!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        author          <- map["author"]
        title           <- map["title"]
        description     <- map["description"]
        url             <- map["url"]
        urlToImage      <- map["urlToImage"]
        source          <- map["source"]
        date            <- map["publishedAt"]
    }
    
    
    
}

class Source:Mappable {
    
    var name : String!
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        
        name       <- map["name"]
        
    }
    
}
