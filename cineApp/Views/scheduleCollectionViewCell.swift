//
//  scheduleCollectionViewCell.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 08/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class scheduleCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var hourLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpViews()  {
        hourLabel.centerAxis(centerXto: centerXAnchor, centerYto: centerYAnchor)
    }
}
