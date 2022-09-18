//
//  TableViewCell.swift
//  VideoDemo
//
//  Created by Arvinder Bhurji on 14/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func comminInint(title: String, videoUrl: String) {
        self.titleLabel.text = title
        
    }
    
}

