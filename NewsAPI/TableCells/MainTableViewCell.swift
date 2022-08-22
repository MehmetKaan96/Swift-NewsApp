//
//  MainTableViewCell.swift
//  NewsAPI
//
//  Created by Mehmet on 14.08.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var newsImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
