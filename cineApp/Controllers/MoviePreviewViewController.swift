//
//  MoviePreviewViewController.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 08/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

class MoviePreviewViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    var indexRoom : Int?
    
    let cellIdentifier = "movieCell"

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    /*
     // MARK: - Movie labels
     */
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var clasificationLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViews()
        
        timeCollectionView.register(UINib(nibName: "scheduleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        timeCollectionView.delegate = self
        timeCollectionView.dataSource = self
      self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Carrito", style: .plain, target: self, action: #selector(cart))
         }

         // MARK: - Table view data source

         @objc func cart(){
             let cartC = CartViewController()
             present(cartC, animated: true, completion: nil)
             
         }
    func setUpViews(){
       
        posterImageView.image = cinemaRooms[indexRoom!].movie.poster
        posterImageView.setConstraintsToBordersAndSizes(topAnchor: self.view.safeAreaLayoutGuide.topAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 250)
        infoStackView.setConstraintsToBordersAndSizes(topAnchor: posterImageView.bottomAnchor, bottomAnchor: nil, leftAnchor: self.view.leftAnchor, rightAnchor: self.view.rightAnchor, width: nil, height: 310, padding: UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10))
        headerView.setConstraintsToBordersAndSizes(topAnchor: infoStackView.bottomAnchor, bottomAnchor: nil, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: 20)
        timeCollectionView.setConstraintsToBordersAndSizes(topAnchor: headerView.bottomAnchor, bottomAnchor: self.view.safeAreaLayoutGuide.bottomAnchor, leftAnchor: view.leftAnchor, rightAnchor: view.rightAnchor, width: nil, height: nil)
        
        titleLabel.text = cinemaRooms[indexRoom!].movie.title
        directorLabel.text = cinemaRooms[indexRoom!].movie.director
        actorsLabel.text = cinemaRooms[indexRoom!].movie.actors
        countryLabel.text = cinemaRooms[indexRoom!].movie.country
        clasificationLabel.text = cinemaRooms[indexRoom!].movie.clasification
        yearLabel.text = cinemaRooms[indexRoom!].movie.year
        durationLabel.text = cinemaRooms[indexRoom!].movie.duration
        synopsisLabel.text = cinemaRooms[indexRoom!].movie.synopsis
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cinemaRooms[indexRoom!].functions.count 
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! scheduleCollectionViewCell
            cell.setUpViews()
            cell.hourLabel.text = cinemaRooms[indexRoom!].functions[indexPath.row]
                  
              
                  return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let buyC = BuyTicketsViewController()
        buyC.indexRoomBut = self.indexRoom
        buyC.indexFunction = indexPath.row
        
        navigationController?.pushViewController(buyC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height:100)
    }
    
    
}
