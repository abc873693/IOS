//
//  SimpleTableViewCell.swift
//  tableveiw2
//
//  Created by Lab301 on 2016/10/27.
//  Copyright © 2016年 Lab301. All rights reserved.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    @IBOutlet var name:UILabel?
    @IBOutlet var location:UILabel?
    @IBOutlet var rImage:UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
