//
//  CartViewController.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 09/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var total: Double = 0.0 {
        willSet {
            totalLabel.text = "Total: \(newValue)"
        }
    }
    
    var candiesToBuy: [Candy] = []
    
    let cellMovieIdentifier = "cellMovie"
    let cellCandiesIdentifier = "cellCandy"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.register(UINib(nibName: "moviesTicketTableViewCell", bundle: nil), forCellReuseIdentifier: cellMovieIdentifier)
        itemsTableView.register(UINib(nibName: "CandiesTicketTableViewCell", bundle: nil), forCellReuseIdentifier: cellCandiesIdentifier)
        
        // Do any additional setup after loading the view.
        setUpViews()
        itemsTableView.dataSource = self
        itemsTableView.delegate = self
        itemsTableView.allowsSelection = false
        
        
        for candy in candies {
            if candy.quantity > 0 {
                candiesToBuy.append(candy)
            }
        }
        getTotal()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    func setUpViews(){
        topLabel.setConstraintsToBordersAndSizes(topAnchor: self.view.safeAreaLayoutGuide.topAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 100)
        bottomView.setConstraintsToBordersAndSizes(topAnchor: nil, bottomAnchor: self.view.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 150)
        
        itemsTableView.setConstraintsToBordersAndSizes(topAnchor: topLabel.bottomAnchor, bottomAnchor: totalLabel.topAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: nil)
        totalLabel.setConstraintsToBordersAndSizes(topAnchor: bottomView.topAnchor, bottomAnchor: nil, leftAnchor: bottomView.leftAnchor, rightAnchor: bottomView.rightAnchor, width: nil, height: 40, padding: UIEdgeInsets(top: 10, left: 10, bottom: 0, right: -10))
    }
    
    func getTotal(){
        
        for ticket in cartTickets {
            total += ticket.total
        }
        
        for candy in candiesToBuy{
            total += candy.price * Double(candy.quantity)
        }
        
        totalLabel.text = "Total:  \(total)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cartTickets.count
        case 1:
            return candiesToBuy.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let tcell = itemsTableView.dequeueReusableCell(withIdentifier: cellMovieIdentifier, for: indexPath) as! moviesTicketTableViewCell
            tcell.setupViews()
            tcell.ticket = cartTickets[indexPath.row]
            
            cell = tcell
        case 1:
            let ccell = itemsTableView.dequeueReusableCell(withIdentifier: cellCandiesIdentifier, for: indexPath) as! CandiesTicketTableViewCell
            ccell.setupViews()
            ccell.candy = candiesToBuy[indexPath.row]
            cell = ccell
            
        default:
            print("Something Wrong")
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 140
        case 1:
            return 125
        default:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            if !cartTickets.isEmpty {
                return "Boletos"
            }
            
        case 1:
            if !candiesToBuy.isEmpty {
                return "Dulces"
            }
            
        default:
            return "Error"
        }
        
        return nil
    }
    
}
