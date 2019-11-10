//
//  ItemTableViewCell.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 08/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var titleItemLabel: UILabel!
    @IBOutlet weak var priceItemLabel: UILabel!
    @IBOutlet weak var itemStepper: UIStepper!
    @IBOutlet weak var amountItemSteper: UILabel!
    

    var indexCandy : Int?
    
    var candy:Candy?{
        didSet{
            if let name  = candy?.name{
                titleItemLabel.text = name
            }
            if let image  = candy?.image{
                itemImage.image = image
            }
            if let price  = candy?.price{
                priceItemLabel.text = "$\(price)"
            }
            if let quantity = candy?.quantity{
                amountItemSteper.text = "\(quantity)"
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
    
    
    func setUpView(){
        itemImage.backgroundColor = .black
        
        itemImage.setConstraintsToBordersAndSizes(topAnchor:self.topAnchor, bottomAnchor: nil, leftAnchor: self.leftAnchor, rightAnchor: nil, width: frame.height-10, height: frame.height-10, padding: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: 0))
        
       titleItemLabel.setConstraintsToBordersAndSizes(topAnchor: self.topAnchor, bottomAnchor: nil, leftAnchor: self.itemImage.rightAnchor, rightAnchor: self.rightAnchor, width: nil, height: 70, padding: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5))
        priceItemLabel.setConstraintsToBordersAndSizes(topAnchor: self.titleItemLabel.bottomAnchor, bottomAnchor: nil, leftAnchor: self.itemImage.rightAnchor, rightAnchor: self.rightAnchor, width: nil, height: 20, padding: UIEdgeInsets(top: 5, left: 5, bottom: 0, right: 5))
        
        itemStepper.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: self.bottomAnchor, leftAnchor: nil, rightAnchor: self.rightAnchor, width: 100, height: 30, padding: UIEdgeInsets(top: 0, left: 0, bottom: -5, right: -5))
        amountItemSteper.centerAxis(centerXto: nil, centerYto: itemStepper.centerYAnchor)
        amountItemSteper.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: nil, leftAnchor: nil, rightAnchor: itemStepper.leftAnchor, width: 100, height: 30, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -5))
       
        
    }
    
    
    
    @IBAction func itemSteper(_ sender: Any) {
        candies[indexCandy!].quantity = Int(itemStepper.value)
//        guard let amount = candy?.quantity else {return}
        amountItemSteper.text = "\(candies[indexCandy!].quantity)"
    }
    
}
