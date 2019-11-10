//
//  BuyTicketsViewController.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 08/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class BuyTicketsViewController: UIViewController {
    var indexRoomBut : Int?
    var indexFunction:Int?
    @IBOutlet weak var minorsLeftTickets: UILabel!
    
    @IBOutlet weak var adultsLeftTickets: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var buyTicketsStackView: UIStackView!
    @IBOutlet weak var leftTicketsLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
       self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Carrito", style: .plain, target: self, action: #selector(cart))
         }

         // MARK: - Table view data source

         @objc func cart(){
             let cartC = CartViewController()
             present(cartC, animated: true, completion: nil)
             
         }
    
    var adultTickets: Int = 0 {
        willSet {
            adultsLeftTickets.text = "\(newValue)"
        }
        didSet {
            remainigTickets()
        }
    }
    
    var kidsTickets: Int = 0 {
        willSet {
            minorsLeftTickets.text = "\(newValue)"
        }
        didSet {
            remainigTickets()
        }
    }
    
    var total: Double = 0.0 {
        willSet {
            totalLabel.text = "$\(newValue)"
        }
    }
    var leftTickets: Int = 0 {
           willSet {
               leftTicketsLabel.text = "Boletos restantes en la Sala: \(newValue)"
               
               if newValue < 0 {
                   sendAlertTickets()
               }
           }
       }


    func setupView(){
        posterImageView.setConstraintsToBordersAndSizes(topAnchor: self.view.safeAreaLayoutGuide.topAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 250)
        titlelabel.setConstraintsToBordersAndSizes(topAnchor: posterImageView.bottomAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 30, padding: UIEdgeInsets(top: 10, left: 8, bottom: 0, right: -8))
        subtitleLabel.setConstraintsToBordersAndSizes(topAnchor: titlelabel.bottomAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 55, padding: UIEdgeInsets(top: 5, left: 8, bottom: 0, right: -8))
        buyTicketsStackView.setConstraintsToBordersAndSizes(topAnchor: subtitleLabel.bottomAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 70, padding: UIEdgeInsets(top: 10, left: 8, bottom: 0, right: -8))
        buyButton.centerAxis(centerXto: view.centerXAnchor, centerYto: nil)
        buyButton.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, leftAnchor: nil, rightAnchor: nil, width: 200, height: 50, padding: UIEdgeInsets(top: 0, left:0 , bottom: 0, right: -50))
        leftTicketsLabel.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: buyButton.topAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 30, padding: UIEdgeInsets(top: 0, left: 8, bottom: -10, right: -8))
        totalLabel.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: leftTicketsLabel.topAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 30, padding: UIEdgeInsets(top: 0, left: 8, bottom: -10, right: -8))
        posterImageView.image = cinemaRooms[indexRoomBut!].movie.poster
        leftTickets = cinemaRooms[indexRoomBut!].seats
    }
    
    func sendAlertTickets(){
           let alert = UIAlertController(title: "Error", message: "Lo sentimos, no hay suficientes boletos en la sala", preferredStyle: .alert)
           let action = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
           }
           alert.addAction(action)
           present(alert, animated: true)
       }
    
    func remainigTickets() {
           leftTickets = cinemaRooms[indexRoomBut!].seats - (kidsTickets + adultTickets)
       }
    func updateTotal(){
        total = Double(kidsTickets) * Constants.kidTicketPrice + Double(adultTickets) * Constants.adultTicketPrice
    }

    @IBAction func adultsStepper(_ sender: UIStepper) {
        adultTickets = Int(sender.value)
        updateTotal()
        
        
    }
    @IBAction func minorsStepper(_ sender: UIStepper) {
        kidsTickets = Int(sender.value)
        updateTotal()
    }
    
    @IBAction func buyTickets(_ sender: Any) {
        
        var seats: [(Int, Seat)] = []
        
        if adultTickets > 0 {
            seats.append((adultTickets, .adult))
        }
        if kidsTickets > 0 {
            seats.append((kidsTickets, .kid))
        }
        
        let ticket = Ticket(seats: seats, function: cinemaRooms[indexRoomBut!].functions[indexFunction!], movie: cinemaRooms[indexRoomBut!].movie, total: total)
        
        cartTickets.append(ticket)

       
        cinemaRooms[indexRoomBut!].seats = leftTickets

       
        
        navigationController?.popToRootViewController(animated: true)

    }
}
