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
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setCell(urlString:String,title:String,text:String)  {
        titleLabel.text = title
        mainTextLabel.text = text
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
