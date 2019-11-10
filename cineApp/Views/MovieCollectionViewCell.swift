//
//  MovieCollectionViewCell.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 9/28/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpView() {
        movieImageView.setConstraintsToBordersAndSizes(topAnchor: self.topAnchor, bottomAnchor: self.bottomAnchor, leftAnchor: self.leftAnchor, rightAnchor: self.rightAnchor, width: nil, height: nil)
    }

}
