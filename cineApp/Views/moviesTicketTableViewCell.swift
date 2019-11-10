//
//  moviesTicketTableViewCell.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 10/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class moviesTicketTableViewCell: UITableViewCell {
    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var totalMovieLabel: UILabel!
    @IBOutlet weak var adultsTicketsLabel: UILabel!
    @IBOutlet weak var minorsTicketsLabel: UILabel!
    
    
    var ticket:Ticket?{
          didSet{
            if let name  = ticket?.movie.title, let function = ticket?.function{
                  titleMovieLabel.text = "\(name) - \(function)"
              }
            
              
            adultsTicketsLabel.text = "\(getNumberOfSeatsForTicketsIn(ticket!, seatType: .adult)) - Adultos"
              
            minorsTicketsLabel.text = "\(getNumberOfSeatsForTicketsIn(ticket!, seatType: .kid)) - Niños"
            if let total  = ticket?.total{
            totalMovieLabel.text = "$ \(total)"
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
        titleMovieLabel.setConstraintsToBordersAndSizes(topAnchor: topAnchor, bottomAnchor: nil, leftAnchor: leftAnchor, rightAnchor: rightAnchor, width: nil, height: 25, padding: UIEdgeInsets(top: 10, left: 8, bottom: 0, right: -8))
        totalMovieLabel.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: bottomAnchor, leftAnchor: nil, rightAnchor: rightAnchor, width: 150, height: 30, padding: UIEdgeInsets(top: 0, left: 0, bottom: -10, right: -8))
        adultsTicketsLabel.setConstraintsToBordersAndSizes(topAnchor: titleMovieLabel.bottomAnchor, bottomAnchor: nil, leftAnchor: leftAnchor, rightAnchor: totalMovieLabel.leftAnchor, width: nil, height: 20, padding: UIEdgeInsets(top: 5, left: 8, bottom: 0, right: 0))
        minorsTicketsLabel.setConstraintsToBordersAndSizes(topAnchor: adultsTicketsLabel.bottomAnchor, bottomAnchor: nil, leftAnchor: leftAnchor, rightAnchor: totalMovieLabel.leftAnchor, width: nil, height: 20, padding: UIEdgeInsets(top: 5, left: 8, bottom: 0, right: 0))
    }
    
    func getNumberOfSeatsForTicketsIn(_ ticket: Ticket, seatType: Seat) -> Int {
        var numberOfSeats: Int = 0
        
        for seat in ticket.seats {
            if seat.1 == seatType {
                numberOfSeats += seat.0
            }
        }
        
        return numberOfSeats
    }
}
