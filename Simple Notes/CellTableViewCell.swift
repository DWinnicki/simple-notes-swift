//
//  CellTableViewCell.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-14.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var passwordIcon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         title.adjustsFontForContentSizeCategory = true
         date.adjustsFontForContentSizeCategory = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected state
        
        super.setSelected(selected, animated: animated)
        let selView = UIView()
        
        selView.backgroundColor = UIColor( red: 5/255, green: 90/255, blue:223/255, alpha: 0.2 )
        self.selectedBackgroundView = selView
    }
}
