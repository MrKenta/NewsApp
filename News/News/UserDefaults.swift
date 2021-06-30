//
//  UserDefaults.swift
//  News
//
//  Created by Raman Krutsiou on 6/26/21.
//

import Foundation

class Settings {
    
    static let shared = Settings()
    private init () {}
    private let defaults = UserDefaults.standard
    var categor = CategoryEnum.allCases
    
    var isFirstLaunch : Bool {
        set{
            defaults.setValue(newValue, forKey:"Launch")
        }
        get {
            return defaults.value(forKey:"Launch") as? Bool ?? true
        }
    }
    
    var lang : String {
        set{
            defaults.setValue(newValue, forKey:"Lang")
        }
        get{
            return defaults.value(forKey:"Lang") as? String ?? "jp"
        }
    }
    
    var showController : [String:Bool] {
        set {
            defaults.setValue(newValue, forKey: "Controllers")
        }
        get {
            return defaults.value(forKey:"Controllers") as? [String:Bool] ?? [String:Bool]()
        }
    }
    var darkMode : Bool {
        set{
            defaults.setValue(newValue, forKey:"Mode")
        }
        get {
            return defaults.value(forKey:"Mode") as? Bool ?? false
        }
    }
    
    var multiColorMode : Bool {
        set {
            defaults.setValue(newValue, forKey:"Multicolor")
        }
        get {
            return defaults.value(forKey:"Multicolor") as? Bool ?? false
        }
    }
    
    
    func addCategory() {
        for item in categor {
            showController[item.rawValue] = false
        }
    }
    
}
