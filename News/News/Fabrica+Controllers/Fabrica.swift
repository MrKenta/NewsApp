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
    
    func getController(category:String) -> UITableViewController {
        let controller = SampleTableViewController()
        switch category {
        case Category.business.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"dollarsign.circle.fill"), tag: count)
        case Category.entertainment.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"play.rectangle.fill"), tag: count)
        case Category.general.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"globe"), tag: count)
        case Category.health.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"waveform.path.ecg"), tag: count)
        case Category.science.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"magnifyingglass"), tag: count)
        case Category.sports.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"sportscourt.fill"), tag: count)
        case Category.technology.rawValue:
            controller.tabBarItem = UITabBarItem(title:category, image:UIImage(systemName:"airplane"), tag: count)
        default:
            break
        }
        controller.title = category.uppercased()
        count += 1
        return controller
        
    }
    
}
