//
//  SettingsVC.swift
//  News
//
//  Created by Raman Krutsiou on 5/25/21.
//

import Foundation
import UIKit


class SettingsVC: UITableViewController{
    

    @IBOutlet weak var langPicker: UIPickerView!
    @IBOutlet weak var businessSwitch: UISwitch!
    @IBOutlet weak var entertainmentSwitch: UISwitch!
    @IBOutlet weak var generalSwitch: UISwitch!
    @IBOutlet weak var healthSwitch: UISwitch!
    @IBOutlet weak var scienceSwitch: UISwitch!
    @IBOutlet weak var sportSwitch: UISwitch!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var multicolorSwitch: UISwitch!
    
    
    var country:[Countrys] = [.ar,.at,.au,.be,.bg,.br,.ca,
                              .cn,.co,.cu,.de,.eg,.fr,.gr,
                              .hk,.hu,.id,.ie,.il,.ind,.it,
                              .jp,.kr,.lt,.lv,.ma,.mx,.my,
                              .ng,.nl,.no,.nz,.pl,.pt,.ro,
                              .ru,.sa,.se,.sg,.si,.sk,.th,
                              .tr,.tw,.ua,.us,.ve]
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        langPicker.dataSource = self
        langPicker.delegate = self
        title = "SETTINGS"
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        let button = UIButton(frame:CGRect(x:0, y:0, width:70, height: 40))
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Done", for:.normal )
        button.setTitleColor(.white, for:.normal)
        button.backgroundColor = .blue
        button.setTitleColor(.green, for:.selected)
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
        darkModeSwitch.isOn = Settings.shared.darkMode
        multicolorSwitch.isOn = Settings.shared.multiColorMode
        
        }
    
    
    @objc func showNews() {
        let tabBar = UITabBarController()
        let fabrica = Fabrica()
        fabrica.getControllers()
        switch fabrica.controllersToTabBar.isEmpty {
        case true:
            let alert = UIAlertController(title:"Please, select any category" , message:"Select any category to see news", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title:"OK", style:.cancel, handler:nil))
            present(alert, animated:true)
        case false:
            tabBar.viewControllers = fabrica.controllersToTabBar
            tabBar.modalPresentationStyle = .fullScreen
            present(tabBar, animated: true)
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
        setCountryCode(number:row)
        
        }
    
    
    func setCountryCode(number:Int) {
        switch country[number].rawValue {
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
            print("Add - \(CategoryEnum.business.rawValue)")
    
        case 107:
            Settings.shared.darkMode = true
            print("Add - Dark Mode")
        case 108:
            Settings.shared.multiColorMode = true
            print("Add - \(CategoryEnum.business.rawValue)")
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
