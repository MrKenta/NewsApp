//
//  Category.swift
//  News
//
//  Created by Raman Krutsiou on 5/21/21.
//

import Foundation

class APIKey {
    
    static let shared = APIKey()
    private init () {}
    let apiKey = "d935e0c0a1774de093b2ede89e82753d"
    var countryRequest = ""
    var category = [String]()
    var darkMode = false
    var multicolor = false
    
}


enum Category:String {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}

enum Countrys:String {
    case ar = "Argentina"
    case at = "Austria"
    case au = "Australia"
    case be = "Belgium"
    case bg = "Bulgaria"
    case br = "Brazil"
    case ca = "Canada"
    case cn = "China"
    case co = "Colombia"
    case cu = "Cuba"
    case de = "Germany"
    case eg = "Egypt"
    case fr = "France"
    case gr = "Greece"
    case hk = "Hong Kong"
    case hu = "Hungary"
    case id = "Indonesia"
    case ie = "Ireland"
    case il = "Israel"
    case ind = "India"
    case it = "Italy"
    case jp = "Japan"
    case kr = "Korea"
    case lt = "Lithuania"
    case lv = "Latvia"
    case ma = "Morocco"
    case mx = "Mexico"
    case my = "Malaysia"
    case ng = "Nigeria"
    case nl = "Netherlands"
    case no = "Norway"
    case nz = "New Zealand"
    case pl = "Poland"
    case pt = "Portugal"
    case ro = "Romania"
    case ru = "Russian Federation"
    case sa = "Saudi Arabia"
    case se = "Sweden"
    case sg = "Sudan"
    case si = "Slovenia"
    case sk = "Slovakia"
    case th = "Thailand"
    case tr = "Turkey"
    case tw = "Taiwan"
    case ua = "Ukraine"
    case us = "United States of America"
    case ve = "Venezuela"
}


