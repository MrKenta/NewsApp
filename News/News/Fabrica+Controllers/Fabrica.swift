//
//  Fabrica.swift
//  News
//
//  Created by Raman Krutsiou on 5/21/21.
//

import Foundation
import UIKit

class Fabrica {
 
    var count = 0
    var controllersToTabBar = [UINavigationController]()
    var categry = Settings.shared.showController
  
    
    func getControllers() {
        
        for item in categry {
            switch item.value {
            case true:
                let tableControllers = SampleTableViewController()
                let navigationVC = UINavigationController(rootViewController:tableControllers)
                switch item.key {
                        case CategoryEnum.business.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"dollarsign.circle.fill"), tag: count)
                        case CategoryEnum.entertainment.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"play.rectangle.fill"), tag: count)
                        case CategoryEnum.general.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"globe"), tag: count)
                        case CategoryEnum.health.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"waveform.path.ecg"), tag: count)
                        case CategoryEnum.science.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"magnifyingglass"), tag: count)
                        case CategoryEnum.sports.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"sportscourt.fill"), tag: count)
                        case CategoryEnum.technology.rawValue:
                            tableControllers.tabBarItem = UITabBarItem(title:item.key, image:UIImage(systemName:"airplane"), tag: count)
                        default:
                            break
                        }
                tableControllers.title = item.key.uppercased()
                controllersToTabBar.append(navigationVC)
                count += 1
            case false:
                print("false")
            }
        }
        
    }
   
    
    
    
}
