//
//  SettingsVC.swift
//  News
//
//  Created by Raman Krutsiou on 5/25/21.
//

import Foundation
import UIKit


class SettingsVC: UITableViewController{
    
    @IBOutlet weak var acceptButton: UIButton!
    @IBOutlet weak var langPicker: UIPickerView!
    var country:[Countrys] = [.ar,.at,.au,.be,.bg,.br,.ca,
                              .cn,.co,.cu,.de,.eg,.fr,.gr,
                              .hk,.hu,.id,.ie,.il,.ind,.it,
                              .jp,.kr,.lt,.lv,.ma,.mx,.my,
                              .ng,.nl,.no,.nz,.pl,.pt,.ro,
                              .ru,.sa,.se,.sg,.si,.sk,.th,
                              .tr,.tw,.ua,.us,.ve]
    var categorys:[Category] = [.business,.entertainment,.general,.health,.science,.sports,.technology]
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        langPicker.dataSource = self
        langPicker.delegate = self
        title = "SETTINGS"
        acceptButton.layer.cornerRadius = 15
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        navigationController?.navigationBar.barTintColor = .white
        tabBarController?.tabBar.barTintColor = .white
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
    
    @IBAction func showVC(_ sender: Any) {
        
        let tabBar = UITabBarController()
        var controllers = [UIViewController]()
        let fabrica = Fabrica()
        
        for i in 0...APIKey.shared.category.count - 1 {
            print(APIKey.shared.category.count)
            let controller = fabrica.getController(category:APIKey.shared.category[i])
            controllers.append(controller)
        }
        tabBar.viewControllers = controllers
        navigationController?.pushViewController(tabBar, animated:true)
        
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
            APIKey.shared.countryRequest = "ar"
        case "Austria":
            APIKey.shared.countryRequest = "at"
        case "Australia":
            APIKey.shared.countryRequest = "au"
        case "Belgium":
            APIKey.shared.countryRequest = "be"
        case "Bulgaria":
            APIKey.shared.countryRequest = "bg"
        case "Brazil":
            APIKey.shared.countryRequest = "br"
        case "Canada":
            APIKey.shared.countryRequest = "ca"
        case "China":
            APIKey.shared.countryRequest = "cn"
        case "Colombia":
            APIKey.shared.countryRequest = "co"
        case "Cuba":
            APIKey.shared.countryRequest = "cu"
        case "Germany":
            APIKey.shared.countryRequest = "de"
        case "Egypt":
            APIKey.shared.countryRequest = "eg"
        case "France":
            APIKey.shared.countryRequest = "fr"
        case "Greece":
            APIKey.shared.countryRequest = "gr"
        case "Hong Kong":
            APIKey.shared.countryRequest = "hk"
        case "Hungary":
            APIKey.shared.countryRequest = "hu"
        case "Indonesia":
            APIKey.shared.countryRequest = "id"
        case "Ireland":
            APIKey.shared.countryRequest = "ie"
        case "Israel":
            APIKey.shared.countryRequest = "il"
        case "India":
            APIKey.shared.countryRequest = "in"
        case "Italy":
            APIKey.shared.countryRequest = "it"
        case "Japan":
            APIKey.shared.countryRequest = "jp"
        case "Korea":
            APIKey.shared.countryRequest = "kr"
        case "Lithuania":
            APIKey.shared.countryRequest = "lt"
        case "Latvia":
            APIKey.shared.countryRequest = "lv"
        case "Morocco":
            APIKey.shared.countryRequest = "ma"
        case "Mexico":
            APIKey.shared.countryRequest = "mx"
        case "Malaysia":
            APIKey.shared.countryRequest = "my"
        case "Nigeria":
            APIKey.shared.countryRequest = "ng"
        case "Netherlands":
            APIKey.shared.countryRequest = "nl"
        case "Norway":
            APIKey.shared.countryRequest = "no"
        case "New Zealand":
            APIKey.shared.countryRequest = "nz"
        case "Poland":
            APIKey.shared.countryRequest = "pl"
        case "Portugal":
            APIKey.shared.countryRequest = "pt"
        case "Romania":
            APIKey.shared.countryRequest = "ro"
        case "Russian Federation":
            APIKey.shared.countryRequest = "ru"
        case "Saudi Arabia":
            APIKey.shared.countryRequest = "sa"
        case "Sweden":
            APIKey.shared.countryRequest = "se"
        case "Sudan":
            APIKey.shared.countryRequest = "sg"
        case "Slovenia":
            APIKey.shared.countryRequest = "si"
        case "Slovakia":
            APIKey.shared.countryRequest = "sk"
        case "Thailand":
            APIKey.shared.countryRequest = "th"
        case "Turkey":
            APIKey.shared.countryRequest = "tr"
        case "Taiwan":
            APIKey.shared.countryRequest = "tw"
        case "Ukraine":
            APIKey.shared.countryRequest = "ua"
        case "United States of America":
            APIKey.shared.countryRequest = "us"
        case "Venezuela":
            APIKey.shared.countryRequest = "ve"
        default:
            APIKey.shared.countryRequest = "us"
        }
    }
    
    func addCatedory(_ sender:UISwitch){
        switch sender.tag {
        case 100:
            APIKey.shared.category.append(categorys[0].rawValue)
            print("Add - \(categorys[0].rawValue)")
        case 101:
            APIKey.shared.category.append(categorys[1].rawValue)
            print("Add - \(categorys[1].rawValue)")
        case 102:
            APIKey.shared.category.append(categorys[2].rawValue)
            print("Add - \(categorys[2].rawValue)")
        case 103:
            APIKey.shared.category.append(categorys[3].rawValue)
            print("Add - \(categorys[3].rawValue)")
        case 104:
            APIKey.shared.category.append(categorys[4].rawValue)
            print("Add - \(categorys[4].rawValue)")
        case 105:
            APIKey.shared.category.append(categorys[5].rawValue)
            print("Add - \(categorys[5].rawValue)")
        case 106:
            APIKey.shared.category.append(categorys[6].rawValue)
            print("Add - \(categorys[6].rawValue)")
        case 107:
            APIKey.shared.darkMode = true
        case 108:
            APIKey.shared.multicolor = true
        default:
            break
        }
        }
    func deleteCategory(_ sender:UISwitch) {
        switch sender.tag {
        case 100:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[0].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[0].rawValue)")
        case 101:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[1].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[1].rawValue)")
        case 102:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[2].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[2].rawValue)")
        case 103:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[3].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[3].rawValue)")
        case 104:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[4].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[4].rawValue)")
        case 105:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[5].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[5].rawValue)")
        case 106:
            for i in 0...APIKey.shared.category.count - 1 {
                if APIKey.shared.category[i] == categorys[6].rawValue {
                    APIKey.shared.category.remove(at:i)
                }
            }
            print("Remove - \(categorys[6].rawValue)")
        case 107:
            APIKey.shared.darkMode = false
        case 108:
            APIKey.shared.multicolor = false
        default:
            break
        }
    }
    }
