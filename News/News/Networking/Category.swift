//
//  Category.swift
//  News
//
//  Created by Raman Krutsiou on 5/21/21.
//

import Foundation

class APIKey {
    static let shared = APIKey()
    
    let apiKey = "d935e0c0a1774de093b2ede89e82753d"
    
}


enum CategoryEnum:String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
}

enum Countrys:String, CaseIterable {
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

class CountryCode  {
    
    func  getCountryCode(countryName: String) {
        switch countryName {
        case "Argentina":
            Settings.shared.lang = "ar"
        case "Austria":
            Settings.shared.lang = "at"
        case "Australia":
            Settings.shared.lang = "au"
        case "Belgium":
            Settings.shared.lang = "be"
        case "Bulgaria":
            Settings.shared.lang = "bg"
        case "Brazil":
            Settings.shared.lang = "br"
        case "Canada":
            Settings.shared.lang = "ca"
        case "China":
            Settings.shared.lang = "cn"
        case "Colombia":
            Settings.shared.lang = "co"
        case "Cuba":
            Settings.shared.lang = "cu"
        case "Germany":
            Settings.shared.lang = "de"
        case "Egypt":
            Settings.shared.lang = "eg"
        case "France":
            Settings.shared.lang = "fr"
        case "Greece":
            Settings.shared.lang = "gr"
        case "Hong Kong":
            Settings.shared.lang = "hk"
        case "Hungary":
            Settings.shared.lang = "hu"
        case "Indonesia":
            Settings.shared.lang = "id"
        case "Ireland":
            Settings.shared.lang = "ie"
        case "Israel":
            Settings.shared.lang = "il"
        case "India":
            Settings.shared.lang = "in"
        case "Italy":
            Settings.shared.lang = "it"
        case "Japan":
            Settings.shared.lang = "jp"
        case "Korea":
            Settings.shared.lang = "kr"
        case "Lithuania":
            Settings.shared.lang = "lt"
        case "Latvia":
            Settings.shared.lang = "lv"
        case "Morocco":
            Settings.shared.lang = "ma"
        case "Mexico":
            Settings.shared.lang = "mx"
        case "Malaysia":
            Settings.shared.lang = "my"
        case "Nigeria":
            Settings.shared.lang = "ng"
        case "Netherlands":
            Settings.shared.lang = "nl"
        case "Norway":
            Settings.shared.lang = "no"
        case "New Zealand":
            Settings.shared.lang = "nz"
        case "Poland":
            Settings.shared.lang = "pl"
        case "Portugal":
            Settings.shared.lang = "pt"
        case "Romania":
            Settings.shared.lang = "ro"
        case "Russian Federation":
            Settings.shared.lang = "ru"
        case "Saudi Arabia":
            Settings.shared.lang = "sa"
        case "Sweden":
            Settings.shared.lang = "se"
        case "Sudan":
            Settings.shared.lang = "sg"
        case "Slovenia":
            Settings.shared.lang = "si"
        case "Slovakia":
            Settings.shared.lang = "sk"
        case "Thailand":
            Settings.shared.lang = "th"
        case "Turkey":
            Settings.shared.lang = "tr"
        case "Taiwan":
            Settings.shared.lang = "tw"
        case "Ukraine":
            Settings.shared.lang = "ua"
        case "United States of America":
            Settings.shared.lang = "us"
        case "Venezuela":
            Settings.shared.lang = "ve"
        default:
            Settings.shared.lang = "us"
        }
        
    }
}
