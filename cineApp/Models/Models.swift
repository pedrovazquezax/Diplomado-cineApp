//
//  Models.swift
//  cineApp
//
//  Created by Pedro Antonio Vazquez Rodriguez on 09/11/19.
//  Copyright © 2019 Pedro Antonio Vazquez Rodriguez. All rights reserved.
//

import UIKit

struct CinemaRoom {
    let movie: Movie
    var seats: Int
    let roomNumber: Int
    let functions: [String]
}
class Constants {
    static let adultTicketPrice: Double = 80.0
    static let kidTicketPrice: Double = 60.0
}

struct Ticket {
    let seats: [(Int, Seat)]
    let function: String
    let movie: Movie
    let total: Double
}

enum Seat {
    case adult
    case kid
}

struct Candy {
    let name: String
    let image: UIImage
    let price: Double
    var quantity: Int
}
struct Movie {
    let title: String
    let synopsis: String
    let director: String
    let actors:String
    let country:String
    let clasification:String
    let year:String
    let duration:String
    let poster: UIImage
}


let jokerMovie = Movie(title:"El Bromas", synopsis: "In Gotham City, mentally-troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: The Joker", director: "Todd Phillips", actors:"Joaquin Phoenix, Robert De Niro" ,country:"USA",clasification:"B15",year:"2019",duration:"2h 15min",poster:UIImage(named: "joker")!)


let toyStory = Movie(title:"Toy Story", synopsis: "When a new toy called Forky joins Woody and the gang, a road trip alongside old and new friends reveals how big the world can be for a toy.", director: "Josh Cooley", actors:"Tom Hanks, Tim Allen" ,country:"USA",clasification:"A",year:"2019",duration:"1h 40min",poster:UIImage(named: "toystory")!)

let nemo = Movie(title:"Buscando a Nemo", synopsis: "After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.", director: "Andrew Stanton, Lee Unkrich", actors:"Albert Brooks, Ellen DeGeneres",country:"USA",clasification:"A",year:"2003",duration:"1h 40min",poster:UIImage(named: "nemo")!)

let deadpool = Movie(title:"Deadpool 2", synopsis: "Foul-mouthed mutant mercenary Wade Wilson (a.k.a. Deadpool), brings together a team of fellow mutant rogues to protect a young boy with supernatural abilities from the brutal, time-traveling cyborg Cable.", director: "David Leitch", actors:"Ryan Reynolds, Josh Brolin" ,country:"USA",clasification:"A",year:"2018",duration:"1h 59min",poster:UIImage(named: "deadpool")!)

let dragonBall = Movie(title:"Dragon Ball Z", synopsis: "After learning that he is from another planet, a warrior named Goku and his friends are prompted to defend it from an onslaught of extraterrestrial enemies.", director: " ", actors:"  " ,country:"JPN",clasification:"B",year:"1996",duration:"1h 40min",poster:UIImage(named: "dragonball")!)
let mulan = Movie(title:"Mulan", synopsis: "A young Chinese maiden disguises herself as a male warrior in order to save her father. A live-action feature film based on Disney's 'Mulan.'", director: "Niki Caro", actors:"Yifei Liu, Donnie Yen" ,country:"JPN",clasification:"A",year:"2020",duration:"1h 40min",poster:UIImage(named: "mulan")!)



let room1 = CinemaRoom(movie: jokerMovie, seats: 30, roomNumber: 1, functions: ["11:00", "15:00", "20:00", "00:00"])

let room2 = CinemaRoom(movie: toyStory, seats: 55, roomNumber: 2, functions: ["09:00", "12:00", "15:00", "18:00", "22:00", "00:00"])

let room3 = CinemaRoom(movie: nemo, seats: 80, roomNumber: 3, functions: ["15:00", "18:00","19:00", "22:00"])
let room4 = CinemaRoom(movie: deadpool, seats: 15, roomNumber: 4, functions: ["11:00", "15:00","19:00", "22:00"])
let room5 = CinemaRoom(movie: dragonBall, seats: 60, roomNumber: 5, functions: ["19:00"])
let room6 = CinemaRoom(movie: mulan, seats: 45, roomNumber: 6, functions: ["00:00"])


var cinemaRooms = [room1, room2, room3,room4,room5,room6]


var kitkat = Candy(name: "Kit Kat", image: UIImage(named: "kitkat")!, price: 20.0, quantity: 0)
var panditas = Candy(name: "Panditas", image: UIImage(named: "panditas")!, price: 35.0, quantity: 0)
var icee = Candy(name: "Icee", image: UIImage(named: "icee")!, price: 40.0, quantity: 0)
var skittles = Candy(name: "Skittles", image: UIImage(named: "skittles")!, price: 17.0, quantity: 0)
var popcorn = Candy(name: "Palomitas", image: UIImage(named: "palomitas")!, price: 60.0, quantity: 0)

var icecream = Candy(name: "Helado", image: UIImage(named: "helado")!, price: 50.0, quantity: 0)

var miniicecream = Candy(name: "Cono Helado", image: UIImage(named: "cono")!, price: 25.0, quantity: 0)
var soda  = Candy(name: "Refresco", image: UIImage(named: "refresco")!, price: 25.0, quantity: 0)

var candies = [kitkat, panditas, icee, skittles,popcorn,icecream,miniicecream,soda]

var cartTickets: [Ticket] = []
