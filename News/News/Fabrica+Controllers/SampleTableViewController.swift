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
        
        
        let cell = UINib(nibName:String(describing:SampleCell.self), bundle:nil)
        tableView.register(cell, forCellReuseIdentifier:String(describing:SampleCell.self))
        
        switch title {
        case Category.business.rawValue.uppercased():
            NetworkManager.shared.getBusinessNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.entertainment.rawValue.uppercased():
            NetworkManager.shared.getEntertainmentNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.general.rawValue.uppercased():
            NetworkManager.shared.getGeneralNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.sports.rawValue.uppercased():
            NetworkManager.shared.getSportsNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.health.rawValue.uppercased():
            NetworkManager.shared.getHealthNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.science.rawValue.uppercased():
            NetworkManager.shared.getScienceNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
            }
        case  Category.technology.rawValue.uppercased():
            NetworkManager.shared.getTechnologyNews(data:APIKey.shared) { (ServerResponse) in
                self.arrayNews = ServerResponse.data
                self.tableView.reloadData()
            } failure: { (error) in
                print(error)
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

        newsCell.mainTextLabel.text = arrayNews[indexPath.row].description
        newsCell.titleLabel.text = arrayNews[indexPath.row].title
        
        
        if let authorText = arrayNews[indexPath.row].source.name {
            newsCell.authorLabel.text = authorText
        }
        newsCell.dateLabel.text = arrayNews[indexPath.row].date
        
        switch APIKey.shared.darkMode {
        case true:
            self.view.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            tabBarController?.tabBar.barTintColor = .black
            newsCell.backgroundColor = .black
            newsCell.mainTextLabel.textColor = .white
            newsCell.authorLabel.textColor = .white
            newsCell.titleLabel.textColor = .white
            newsCell.dateLabel.textColor = .white
        default:
            navigationController?.navigationBar.barTintColor = .white
        }
        
        
        switch APIKey.shared.multicolor {
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
