//
//  SettingsVC.swift
//  News
//
//  Created by Raman Krutsiou on 5/25/21.
//

import Foundation
import UIKit


class SettingsVC: UITableViewController{
    

    

    @IBOutlet weak var countryField: UITextField!
    
    @IBOutlet weak var businessSwitch: UISwitch!
    @IBOutlet weak var entertainmentSwitch: UISwitch!
    @IBOutlet weak var generalSwitch: UISwitch!
    @IBOutlet weak var healthSwitch: UISwitch!
    @IBOutlet weak var scienceSwitch: UISwitch!
    @IBOutlet weak var sportSwitch: UISwitch!
    @IBOutlet weak var technologySwitch: UISwitch!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var multicolorSwitch: UISwitch!
    
    
    var country = Countrys.allCases
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        let langPicker = UIPickerView()
        countryField.inputView = langPicker
        langPicker.dataSource = self
        langPicker.delegate = self
        title = "SETTINGS"
        
        guard let fontText  = UIFont(name: "AvenirNextCondensed-Regular ", size: 20) else {return}
        countryField.defaultTextAttributes = [NSAttributedString.Key.font: fontText]
        guard let placeholderText = UIFont(name: "AvenirNextCondensed-Regular ", size: 20) else { return }
        countryField.attributedPlaceholder = NSAttributedString(string: "Tap to choose country", attributes: [NSAttributedString.Key.font:placeholderText])
        
        
        let tapGesture = UITapGestureRecognizer(target:self, action:#selector(hidePickerView))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        let button = UIButton(frame:CGRect(x:0, y:0, width:70, height: 35))
        button.layer.cornerRadius = 5
        button.setTitle("Done", for:.normal )
        button.setTitleColor(.systemBlue, for:.normal)
        button.setTitleColor(.green, for:.highlighted)
        button.addTarget(self, action: #selector(showNews), for:.touchUpInside)
        let rightBarButton = UIBarButtonItem(customView:button)
        navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.navigationBar.barTintColor = .white
        tabBarController?.tabBar.barTintColor = .white
        businessSwitch.isOn = Settings.shared.showController[CategoryEnum.business.rawValue]!
        entertainmentSwitch.isOn = Settings.shared.showController[CategoryEnum.entertainment.rawValue]!
        generalSwitch.isOn = Settings.shared.showController[CategoryEnum.general.rawValue]!
        healthSwitch.isOn = Settings.shared.showController[CategoryEnum.health.rawValue]!
        sportSwitch.isOn = Settings.shared.showController[CategoryEnum.sports.rawValue]!
        scienceSwitch.isOn = Settings.shared.showController[CategoryEnum.science.rawValue]!
        technologySwitch.isOn = Settings.shared.showController[CategoryEnum.technology.rawValue]!
        darkModeSwitch.isOn = Settings.shared.darkMode
        multicolorSwitch.isOn = Settings.shared.multiColorMode
        countryField.text = Settings.shared.country
        }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
    
    
    @objc func hidePickerView() {
        self.view.endEditing(true)
    }
    
    @objc func showNews() {
        
            let fabrica = Fabrica()
            fabrica.getControllers()
            switch fabrica.controllersToTabBar.isEmpty {
            case true:
                let alert = UIAlertController(title:"Please, select any category" , message:"Select any category to see news", preferredStyle:.alert)
                alert.addAction(UIAlertAction(title:"OK", style:.cancel, handler:nil))
                present(alert, animated:true)
            case false:
                tabBar.viewControllers = fabrica.controllersToTabBar
                self.view.window?.rootViewController = tabBar
            
                
            if Settings.shared.darkMode && Settings.shared.multiColorMode {
                Settings.shared.multiColorMode = false
                multicolorSwitch.isOn = Settings.shared.multiColorMode
            }
        }
    }
    
    
    @IBAction func switchAcion(_ sender:UISwitch) {
        switch sender.isOn{
        case true:
            addCatedory(sender)
        case false:
            deleteCategory(sender)
        default:
            break
        }
    }
    
}
extension SettingsVC : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        countryField.text = country[row].rawValue
        Settings.shared.country = countryField.text!
        setCountryCode(name: country[row].rawValue)
        
        }
    
    
    
    func setCountryCode(name: String) {
        let code = CountryCode()
        code.getCountryCode(countryName: name)
    }
    
    func addCatedory(_ sender:UISwitch){
        switch sender.tag {
        case 100:
            Settings.shared.showController[CategoryEnum.business.rawValue] = true
            print("Add - \(CategoryEnum.business.rawValue)")
        case 101:
            Settings.shared.showController[CategoryEnum.entertainment.rawValue] = true
            print("Add - \(CategoryEnum.entertainment.rawValue)")
        case 102:
            Settings.shared.showController[CategoryEnum.general.rawValue] = true
            print("Add - general")
        case 103:
            Settings.shared.showController[CategoryEnum.health.rawValue] = true
            print("Add - \(CategoryEnum.health.rawValue)")
        case 104:
            Settings.shared.showController[CategoryEnum.science.rawValue] = true
            print("Add - \(CategoryEnum.sports.rawValue)")
        case 105:
            Settings.shared.showController[CategoryEnum.sports.rawValue] = true
            print("Add - \(CategoryEnum.sports.rawValue)")
        case 106:
            Settings.shared.showController[CategoryEnum.technology.rawValue] = true
            print("Add - \(CategoryEnum.technology.rawValue)")
        case 107:
            Settings.shared.darkMode = true
            print("Add - Dark Mode")
        case 108:
            Settings.shared.multiColorMode = true
            print("Add - Multicolor")
        default:
            break
        }
        }
    func deleteCategory(_ sender:UISwitch) {
        switch sender.tag {
        case 100:
            Settings.shared.showController[CategoryEnum.business.rawValue] = false
            print("Remove - \(CategoryEnum.business.rawValue)")
        case 101:
            Settings.shared.showController[CategoryEnum.entertainment.rawValue] = false
            print("Remove - \(CategoryEnum.entertainment.rawValue)")
        case 102:
            Settings.shared.showController[CategoryEnum.general.rawValue] = false
            print("Remove - general")
        case 103:
            Settings.shared.showController[CategoryEnum.health.rawValue] = false
            print("Remove - \(CategoryEnum.health.rawValue)")
        case 104:
            Settings.shared.showController[CategoryEnum.science.rawValue] = false
            print("Remove - \(CategoryEnum.sports.rawValue)")
        case 105:
            Settings.shared.showController[CategoryEnum.sports.rawValue] = false
            print("Remove - \(CategoryEnum.business.rawValue)")
        case 106:
            Settings.shared.showController[CategoryEnum.technology.rawValue] = false
            print("Add - \(CategoryEnum.technology.rawValue)")
        case 107:
            Settings.shared.darkMode = false
            print("Remove - Dark Mode")
        case 108:
            Settings.shared.multiColorMode = false
            print("Remove - \(CategoryEnum.business.rawValue)")
        default:
            break
        }
    }
    
}
