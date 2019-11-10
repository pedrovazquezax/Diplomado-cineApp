//
//  CandiesTicketTableViewCell.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class CandiesTicketTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var totalCandyLabel: UILabel!
    @IBOutlet weak var nameCandyLabel: UILabel!
    @IBOutlet weak var quantityCandyLabel: UILabel!
    
    
    var candy:Candy?{
    didSet{
        if let name  = candy?.name, let price  = candy?.price, let quantity = candy?.quantity{
            nameCandyLabel.text = name
            quantityCandyLabel.text = "Cantidad: \(quantity)"
            totalCandyLabel.text = "$ \(Double(quantity) * price)"
        }
        
        
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews(){
        nameCandyLabel.setConstraintsToBordersAndSizes(topAnchor: topAnchor, bottomAnchor: nil, leftAnchor: leftAnchor, rightAnchor: rightAnchor, width: nil, height: 25, padding: UIEdgeInsets(top: 10, left: 8, bottom: 0, right: -8))
        totalCandyLabel.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: bottomAnchor, leftAnchor: nil, rightAnchor: rightAnchor, width: 150, height: 30, padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: -8))
        quantityCandyLabel.setConstraintsToBordersAndSizes(topAnchor: nameCandyLabel.bottomAnchor, bottomAnchor: nil, leftAnchor: leftAnchor, rightAnchor: totalCandyLabel.leftAnchor, width: nil, height: 20, padding: UIEdgeInsets(top: 5, left: 8, bottom: 0, right: 0))
       
    }
    
}
