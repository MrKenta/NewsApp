//
//  SampleCell.swift
//  News
//
//  Created by Raman Krutsiou on 5/21/21.
//

import UIKit

class SampleCell: UITableViewCell {


    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var designView: UIView!
    
    var index : Int?
    var newsCategory : String!
    weak var delegate : SaveInCoreData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.startAnimating()
    }
    
    
    func setCell(title:String,text:String)  {
        if text.isEmpty || text == " " {
            stack.isHidden = true
        }
        mainText.text = text
        titleLabel.text = title
        
        newsImage.layer.cornerRadius = 15
        newsImage.layer.borderWidth = 1
        newsImage.layer.borderColor = UIColor.systemTeal.cgColor
        
        designView.layer.cornerRadius = 30
        designView.layer.backgroundColor = UIColor(red: 0.929, green: 0.953, blue: 0.957, alpha: 1).cgColor
        
        titleLabel.font = UIFont(name: "Baskerville-BoldItalic ", size: 25)
        mainText.font = UIFont(name: "Baskerville-Italic" , size: 20)
    
    }
    
    @IBAction func likeAction(_ sender: Any) {
        delegate?.saveNews(indexArray: index!)
        likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
        titleLabel.text = ""
        mainText.text = ""
        
//
    }
    
}
