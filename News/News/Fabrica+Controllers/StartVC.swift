//
//  StartVC.swift
//  News
//
//  Created by Raman Krutsiou on 6/30/21.
//

import UIKit

class StartVC: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.setTitle("Start", for:.normal)
        startButton.setTitleColor(UIColor.white, for:.normal)
        
    }
    
    @IBAction func showNextVC(_ sender: Any) {
        switch Settings.shared.isFirstLaunch {
        case true:
            let storyboard = UIStoryboard(name:"Main", bundle:nil)
            guard let settingsVC = storyboard.instantiateViewController(identifier:String(describing: SettingsVC.self)) as? SettingsVC else { return  }
            let navigationVC = UINavigationController(rootViewController:settingsVC)
            present(navigationVC, animated:true)
        case false:
            let tabBarController = UITabBarController()
            let fabrica = Fabrica()
            fabrica.getControllers()
            tabBarController.viewControllers = fabrica.controllersToTabBar
            tabBarController.modalPresentationStyle = .fullScreen
            present(tabBarController, animated:true)
        }
    }
}
