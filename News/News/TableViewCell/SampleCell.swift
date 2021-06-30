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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    
        override func awakeFromNib() {
        super.awakeFromNib()
        super.prepareForReuse()
    }
    
    
    func setCell(title:String,text:String)  {
        if text.isEmpty || text == "" {
            stack.isHidden = true
        }
        mainText.text = text
        titleLabel.text = title
    
    }
    
    @IBAction func likeAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
