//
//  StartVC.swift
//  News
//
//  Created by Raman Krutsiou on 6/30/21.
//

import UIKit

let tabBar = UITabBarController()


class StartVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tabBar.unselectedItemTintColor = UIColor.systemBlue
        tabBar.tabBar.tintColor = UIColor.systemGreen
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (Timer) in
            switch Settings.shared.isFirstLaunch {
            case true:
                let storyboard = UIStoryboard(name:"Main", bundle:nil)
                Settings.shared.addCategory()
                guard let settingsVC = storyboard.instantiateViewController(identifier:String(describing: SettingsVC.self)) as? SettingsVC else { return  }
                let navigationVC = UINavigationController(rootViewController:settingsVC)
                Settings.shared.isFirstLaunch = false
                self.view.window?.rootViewController = navigationVC
                
            case false:
                let fabrica = Fabrica()
                fabrica.getControllers()
                tabBar.viewControllers = fabrica.controllersToTabBar
                self.view.window?.rootViewController = tabBar
            }
        }
    }
}
