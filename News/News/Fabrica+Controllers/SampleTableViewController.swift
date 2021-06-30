//
//  SampleTableViewController.swift
//  News
//
//  Created by Raman Krutsiou on 5/25/21.
//

import UIKit
import SafariServices

class SampleTableViewController: UITableViewController {
    
    var arrayNews:[MainData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setBarButton()
        
        let cell = UINib(nibName:String(describing:SampleCell.self), bundle:nil)
        tableView.register(cell, forCellReuseIdentifier:String(describing:SampleCell.self))
        switch title {
        case CategoryEnum.business.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getBusinessNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
            
        case  CategoryEnum.entertainment.rawValue.uppercased():
            NetworkManager.shared.getEntertainmentNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        
        case  CategoryEnum.general.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getGeneralNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.sports.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getSportsNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.health.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getHealthNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.science.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getScienceNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.technology.rawValue.uppercased():
            DispatchQueue.global(qos:.userInitiated).async {
                NetworkManager.shared.getTechnologyNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.tableView.reloadData()
                } failure: { (error) in
                    print(error)
                }
            }
        default:
            break
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:String(describing:SampleCell.self), for: indexPath)
        
        guard let newsCell = cell as? SampleCell else { return cell }

        if let title = arrayNews[indexPath.row].title, let mainText = arrayNews[indexPath.row].description, let author = arrayNews[indexPath.row].author, let dateText = arrayNews[indexPath.row].date {
            
            DispatchQueue.main.async {
                newsCell.setCell(title:title, text:mainText)
            }
            
           
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
            if let date = dateFormatter.date(from: dateText){
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let results = dateFormatter.string(from: date)
                newsCell.authorLabel.text = results + "," + author
            }
        }
     
        
        switch Settings.shared.darkMode {
        case true:
            self.view.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            tabBarController?.tabBar.barTintColor = .black
            newsCell.backgroundColor = .black
            newsCell.mainText.textColor = .white
            newsCell.authorLabel.textColor = .white
            newsCell.titleLabel.textColor = .white
            newsCell.dateLabel.textColor = .white
        default:
            navigationController?.navigationBar.barTintColor = .white
        }
        
        
        switch Settings.shared.multiColorMode {
        case true:
             color(cell:newsCell)
            navigationController?.navigationBar.barTintColor = .systemIndigo
            tabBarController?.tabBar.barTintColor = .systemPink
        default:
            break
        }
    
        if let urlText = arrayNews[indexPath.row].urlToImage {
            if let url = URL(string:urlText) {
                
                let session = URLSession.shared
                session.dataTask(with:url) { (data, response, error) in
                    
                    if let imageData = data{
                        DispatchQueue.main.async {
                            newsCell.newsImage.image = UIImage(data:imageData)
                        }
                }
                
            }.resume()
        }
        }
    
        return newsCell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let string = arrayNews[indexPath.row].url else { return }
        
        guard let url = URL(string:string) else { return }
        
        let safariVC = SFSafariViewController(url:url)
        
        present(safariVC, animated:true)
    }
    
    
    func color (cell:UITableViewCell) {
        let randome = Int.random(in:0...9)
        switch randome {
        case 0:
            cell.backgroundColor = .systemBlue
        case 1:
            cell.backgroundColor = .systemPink
        case 2:
            cell.backgroundColor = .systemIndigo
        case 3:
            cell.backgroundColor = .systemGreen
        case 4:
            cell.backgroundColor = .systemOrange
        case 5:
            cell.backgroundColor = .systemYellow
        case 6:
            cell.backgroundColor = .systemRed
        case 7:
            cell.backgroundColor = .systemTeal
        case 8:
            cell.backgroundColor = .systemFill
        case 9:
            cell.backgroundColor = .systemPurple
        default:
            break
        }
    }
    
    func setBarButton() {
        let settingsButton = UIButton(frame:CGRect(x:0, y:0, width:75, height:40))
        settingsButton.layer.cornerRadius = 10
        settingsButton.layer.borderWidth = 1
        settingsButton.layer.borderColor = UIColor.systemBlue.cgColor
        settingsButton.setTitle("Settings", for:.normal)
        settingsButton.setTitleColor(.systemBlue, for:.normal)
        settingsButton.addTarget(self, action:#selector(action), for:.touchUpInside)
        let rightBarButton = UIBarButtonItem(customView:settingsButton)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func action() {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        guard let settingsVC = storyboard.instantiateViewController(identifier:String(describing: SettingsVC.self)) as? SettingsVC else { return  }
        let navigationVC = UINavigationController(rootViewController:settingsVC)
        navigationVC.modalPresentationStyle = .fullScreen
            present(navigationVC, animated: true)
    }
}
