//
//  SampleTableViewController.swift
//  News
//
//  Created by Raman Krutsiou on 5/25/21.
//

import UIKit
import SafariServices
import CoreData

class SampleTableViewController: UITableViewController {
    
    var arrayNews:[MainData] = []
    let concurrecyQueue = DispatchQueue.global(qos:.default)
    let activitiIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(activitiIndicator)
        
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        setAnchords()
        activitiIndicator.style = .large
        activitiIndicator.color = .systemBlue
        activitiIndicator.startAnimating()
        
        setBarButton()
        setLeftBarButton()
        
        let cell = UINib(nibName:String(describing:SampleCell.self), bundle:nil)
        tableView.register(cell, forCellReuseIdentifier:String(describing:SampleCell.self))
        switch title {
        case CategoryEnum.business.rawValue.uppercased():
            concurrecyQueue.sync {
                NetworkManager.shared.getBusinessNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.checkData()
                    self.tableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.tableView.isHidden = false
                    } failure: { (error) in
                        print(error)
                    }
                
            }
                        
        case  CategoryEnum.entertainment.rawValue.uppercased():
            concurrecyQueue.async {
                NetworkManager.shared.getEntertainmentNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.checkData()
                    self.tableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
        
        case  CategoryEnum.general.rawValue.uppercased():
            concurrecyQueue.async {
                NetworkManager.shared.getGeneralNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.checkData()
                    self.tableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.sports.rawValue.uppercased():
            concurrecyQueue.async {
                NetworkManager.shared.getSportsNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.checkData()
                    self.tableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
            
        case  CategoryEnum.health.rawValue.uppercased():
            concurrecyQueue.async {
                NetworkManager.shared.getHealthNews(data:APIKey.shared) { (ServerResponse) in
                    self.arrayNews = ServerResponse.data
                    self.checkData()
                    self.tableView.reloadData()
                    self.activitiIndicator.stopAnimating()
                    self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.science.rawValue.uppercased():
            concurrecyQueue.async {
            NetworkManager.shared.getScienceNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.checkData()
                self.tableView.reloadData()
                self.activitiIndicator.stopAnimating()
                self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
        case  CategoryEnum.technology.rawValue.uppercased():
            concurrecyQueue.async {
            NetworkManager.shared.getTechnologyNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.checkData()
                self.tableView.reloadData()
                self.activitiIndicator.stopAnimating()
                self.tableView.isHidden = false
                } failure: { (error) in
                    print(error)
                }
            }
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tabBarController?.tabBar.isHidden = false
        
        
    }
    
    func setAnchords() {
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        activitiIndicator.centerYAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        activitiIndicator.centerXAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        activitiIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activitiIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
        activitiIndicator.hidesWhenStopped = true
    }
    
        //MARK: - Check Data form Backend
        
    func checkData() {
        var filteredArray = arrayNews.filter({ $0.title != nil || !$0.title.isEmpty || $0.urlToImage != nil})
        arrayNews = filteredArray
    }
        
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:String(describing:SampleCell.self), for: indexPath)
        
        guard let newsCell = cell as? SampleCell else { return cell }
        newsCell.backgroundColor = .clear
        let item = arrayNews[indexPath.row]
        newsCell.delegate = self
        newsCell.index = indexPath.row
        newsCell.selectionStyle = .none
        let dateFormatteInput = DateFormatter()
        dateFormatteInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let dateFormatterOutput = DateFormatter ()
        dateFormatterOutput.dateFormat = "yyyy-MM-dd"
        
        if let date = item.date {
           let input = dateFormatteInput.date(from: date)
        
            if let inputDate = input {
                let output = dateFormatterOutput.string(from: inputDate)
                 if let author = item.author {
                     newsCell.authorLabel.text = "\(author), \(output)"
                 }
             }
            }
    
        var mainText = ""
        
        if let text = item.description {
            mainText = text
        }

        newsCell.setCell(title: item.title, text:mainText)
            
        switch Settings.shared.darkMode {
        case true:
            let textAttributet = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributet
            self.view.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            tabBarController?.tabBar.barTintColor = .black
            newsCell.backgroundColor = .black
            newsCell.mainText.textColor = .white
            newsCell.authorLabel.textColor = .white
            newsCell.titleLabel.textColor = .white
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
    
        if let imageURLString = arrayNews[indexPath.row].urlToImage, let imageURL = URL(string:imageURLString){
            concurrecyQueue.async {
                if let imageData = try? Data(contentsOf:imageURL) {
                    DispatchQueue.main.async {
                        newsCell.newsImage.image = UIImage(data:imageData)
                        newsCell.activityIndicator.stopAnimating()
                        newsCell.activityIndicator.isHidden = true
                    }
                }
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
        settingsButton.setTitle("Settings", for:.normal)
        settingsButton.setTitleColor(.systemGreen, for: .highlighted)
        settingsButton.setTitleColor(.systemBlue, for:.normal)
        settingsButton.addTarget(self, action:#selector(action), for:.touchUpInside)
        let rightBarButton = UIBarButtonItem(customView:settingsButton)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    func setLeftBarButton() {
        let historyButton = UIButton(frame:CGRect(x:0, y:0, width:75, height:40))
        historyButton.layer.cornerRadius = 10
        historyButton.setTitle("Saved News", for:.normal)
        historyButton.setTitleColor(.systemBlue, for:.normal)
        historyButton.setTitleColor(.systemGreen, for: .highlighted)
        historyButton.addTarget(self, action: #selector(showSavedNews), for: .touchUpInside)
        let leftBarButton  = UIBarButtonItem (customView: historyButton)
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func action() {
        let storyboard = UIStoryboard(name:"Main", bundle:nil)
        guard let settingsVC = storyboard.instantiateViewController(identifier:String(describing: SettingsVC.self)) as? SettingsVC else { return  }
       let navigation = UINavigationController(rootViewController:settingsVC)
        self.view.window?.rootViewController = navigation
    }



     @objc func showSavedNews () {
        let savedNews = SavedNewsVC()
        navigationController?.pushViewController(savedNews, animated: true)
}

}
extension SampleTableViewController : SaveInCoreData {
    
    func saveNews(indexArray: Int) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else {return}
        guard let entities = NSEntityDescription.entity(forEntityName: "SavedNews", in: context) else { return  }
        let object = SavedNews(entity: entities, insertInto: context)
        let item = arrayNews[indexArray]
        object.authorName = item.author
        object.dateText = item.date
        object.descriptText = item.description
        object.titleText = item.title
        object.newsCategory = title
        
        if let imageURLString = item.urlToImage,
           let imageURL = URL(string: imageURLString),
           let newsURLString = item.url,
           let newsURL = URL(string: newsURLString){
            object.imageURL = imageURL
            object.newsURL = newsURL
        }
        try! context.save()
        
    }
    
    
    
}
