//
//  SavedNewsVC.swift
//  News
//
//  Created by Raman Krutsiou on 7/17/21.
//

import UIKit
import SafariServices
import CoreData

class SavedNewsVC: UITableViewController {
    
    
    var dataSource : [SavedNews] = []
    var newsCategoryArray = CategoryEnum.allCases
    let activitiIndicator = UIActivityIndicatorView ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activitiIndicator)
        self.view.backgroundColor = .white

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Saved News"
        
        let cell = UINib(nibName:String(describing: SampleCell.self), bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: String(describing: SampleCell.self))
        tableView.isHidden = true
        setAnchords()
        activitiIndicator.style = .large
        activitiIndicator.color = .systemBlue
        activitiIndicator.startAnimating()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        activitiIndicator.startAnimating()
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest: NSFetchRequest<SavedNews> =  SavedNews.fetchRequest()
        
        guard let newsFromCoreData = try? context.fetch(fetchRequest) else {
            let alertController = UIAlertController(title: "Error", message: "Somethig went wrong. Make sure that you save any news", preferredStyle:.alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(alertAction)
            return}
        dataSource = newsFromCoreData
        
        if dataSource.isEmpty {
            let alertController = UIAlertController(title: "Error", message: "Somethig went wrong. Make sure that you save any news", preferredStyle:.alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
                self.navigationController?.popViewController(animated: true)
            }
            alertController.addAction(alertAction)
        }
        
        tableView.reloadData()
        activitiIndicator.startAnimating()
        activitiIndicator.isHidden = true
        tableView.isHidden = false
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        tabBarController?.tabBar.isHidden = false
    }
    
    func deleteNews(index: Int) {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest :NSFetchRequest<SavedNews> = SavedNews.fetchRequest()
        
        guard let allNews = try? context.fetch(fetchRequest) else {return}
        context.delete(allNews[index])
        try? context.save()
        dataSource.remove(at: index)
        tableView.reloadData()
    }
    
    
    func deleteAllNews() {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest :NSFetchRequest<SavedNews> = SavedNews.fetchRequest()
        
        guard let allNews = try? context.fetch(fetchRequest) else {return}
        
        for item in allNews {
            try? context.delete(item)
        }
        
        try? context.save()
        dataSource.removeAll()
        tableView.reloadData()
    }
    
    func setAnchords() {
        activitiIndicator.translatesAutoresizingMaskIntoConstraints = false
        activitiIndicator.centerYAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        activitiIndicator.centerXAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        activitiIndicator.widthAnchor.constraint(equalToConstant: 100).isActive = true
        activitiIndicator.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return dataSource.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SampleCell.self), for: indexPath)
        
        guard let savedNewsCell = cell as? SampleCell else { return cell }
        savedNewsCell.newsCategory = dataSource[indexPath.row].newsCategory
        setCell(cell: savedNewsCell, index: indexPath.row)
        return savedNewsCell
    }
    
    func setCell(cell: SampleCell, index: Int)  {
        
        let item = dataSource[index]
        cell.likeButton.isUserInteractionEnabled = false
        cell.likeButton.isHidden = true
        
        if let title = item.titleText,
           let describ = item.descriptText,
           let author = item.authorName,
           let imageURL = item.imageURL,
           let date = item.dateText{
            
            cell.setCell(title: title, text: describ)
            
            let dateFormatteInput = DateFormatter()
            dateFormatteInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
            let dateFormatterOutput = DateFormatter ()
            dateFormatterOutput.dateFormat = "yyyy-MM-dd"
            
            let inputDate = dateFormatteInput.date(from: date)
            
            if let unwrappedInputDate = inputDate {
                let outputDate = dateFormatterOutput.string(from: unwrappedInputDate)
                cell.authorLabel.text = ("\(author) , \(outputDate)")
            }
            
            DispatchQueue.global(qos: .utility).async {
                 let dataForImage = try? Data(contentsOf: imageURL)
                if let imageData = dataForImage {
                    DispatchQueue.main.async {
                        cell.newsImage.image = UIImage(data: imageData)
                        cell.activityIndicator.stopAnimating()
                        cell.activityIndicator.isHidden = true
                    }
                }
        }
        }
        
        switch Settings.shared.darkMode {
        case true:
            let textAttributet = [NSAttributedString.Key.foregroundColor:UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = textAttributet
            self.view.backgroundColor = .black
            navigationController?.navigationBar.barTintColor = .black
            tabBarController?.tabBar.barTintColor = .black
            cell.backgroundColor = .black
            cell.mainText.textColor = .white
            cell.authorLabel.textColor = .white
            cell.titleLabel.textColor = .white
        default:
            navigationController?.navigationBar.barTintColor = .white
        }
        
        
        switch Settings.shared.multiColorMode {
        case true:
             color(cell:cell)
            navigationController?.navigationBar.barTintColor = .systemIndigo
            tabBarController?.tabBar.barTintColor = .systemPink
        default:
            break
        }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let safariURL = dataSource[indexPath.row].newsURL else { return }
        
        let safariVC = SFSafariViewController(url: safariURL)
        present(safariVC, animated: true, completion: nil)
        
    }
    
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.deleteNews(index: indexPath.row)
        }
            let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
            
        
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
