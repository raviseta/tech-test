//
//  Player.swift
//  Tech Test
//
//  Created by Ravi Seta on 15/05/23.
//

import Foundation
import UIKit

protocol TeamPlayer {
    var countryFlag: UIImage { get set }
    var players: [Player] { get set }
}

struct TeamData {
    let teamName: String
    let countryFlag: UIImage?
    let players: [Player]
}

struct Player {
    let name: String
    let image: UIImage?
}

struct India: TeamPlayer {
    var countryFlag: UIImage
    var players: [Player]
    
    init(countryFlag: UIImage, players: [Player]) {
        self.countryFlag = countryFlag
        self.players = players
    }
    
    static var players: [Player] {
        return [
            Player(name: "Rohit Sharma", image: UIImage(named: "Rohit Sharma")),
            Player(name: "Virat Kohli", image: UIImage(named: "Virat Kohli")),
            Player(name: "KL Rahul", image: UIImage(named: "KL Rahul")),
            Player(name: "Hardik Pandya", image: UIImage(named: "Hardik Pandya")),
            Player(name: "Rishabh Pant", image: UIImage(named: "Rishabh Pant")),
            Player(name: "Dinesh Karthik", image: UIImage(named: "Dinesh Karthik")),
            Player(name: "Ravindra Jadeja", image: UIImage(named: "Ravindra Jadeja")),
            Player(name: "Shreyas Iyer", image: UIImage(named: "Shreyas Iyer")),
            Player(name: "Axar Patel", image: UIImage(named: "Axar Patel")),
            Player(name: "Bhuvneshwar Kumar", image: UIImage(named: "Bhuvneshwar Kumar")),
            Player(name: "Mohammed Shami", image: UIImage(named: "Mohammed Shami")),
            Player(name: "Jasprit Bumrah", image: UIImage(named: "Jasprit Bumrah")),
            Player(name: "Yuzvendra Chahal", image: UIImage(named: "Yuzvendra Chahal"))
        ]
    }
}

struct Australia: TeamPlayer {
    var countryFlag: UIImage
    var players: [Player]
    
    init(countryFlag: UIImage, players: [Player]) {
        self.countryFlag = countryFlag
        self.players = players
    }
    
    static var players: [Player] {
        return [
            Player(name: "David Warner", image: UIImage(named: "David Warner")),
            Player(name: "Usman Khawaja", image: UIImage(named: "Usman Khawaja")),
            Player(name: "Travis Head", image: UIImage(named: "Travis Head")),
            Player(name: "Marnus Labuschagne", image: UIImage(named: "Marnus Labuschagne")),
            Player(name: "Steven Smith", image: UIImage(named: "Steven Smith")),
            Player(name: "Cameron Green", image: UIImage(named: "Cameron Green")),
            Player(name: "Mitchell Marsh", image: UIImage(named: "Mitchell Marsh")),
            Player(name: "Glenn Maxwell", image: UIImage(named: "Glenn Maxwell")),
            Player(name: "Alex Carey", image: UIImage(named: "Alex Carey")),
            Player(name: "Nathan Lyon", image: UIImage(named: "Nathan Lyon")),
            Player(name: "Josh Hazlewood", image: UIImage(named: "Josh Hazlewood")),
            Player(name: "Pat Cummins", image: UIImage(named: "Pat Cummins")),
            Player(name: "Mitchell Starc", image: UIImage(named: "Mitchell Starc")),
        ]
    }
}

struct England: TeamPlayer {
    var countryFlag: UIImage
    var players: [Player]
    
    init(countryFlag: UIImage, players: [Player]) {
        self.countryFlag = countryFlag
        self.players = players
    }
    
    static var players: [Player] {
        return [
            Player(name: "Jason Roy", image: UIImage(named: "Jason Roy")),
            Player(name: "Jos Buttler", image: UIImage(named: "Jos Buttler")),
            Player(name: "James Vince", image: UIImage(named: "James Vince")),
            Player(name: "Joe Root", image: UIImage(named: "Joe Root")),
            Player(name: "Moeen Ali", image: UIImage(named: "Moeen Ali")),
            Player(name: "Jonny Bairstow", image: UIImage(named: "Jonny Bairstow")),
            Player(name: "Ben Stokes", image: UIImage(named: "Ben Stokes")),
            Player(name: "Mark Wood", image: UIImage(named: "Mark Wood")),
            Player(name: "Stuart Broad", image: UIImage(named: "Stuart Broad")),
            Player(name: "James Anderson", image: UIImage(named: "James Anderson")),
            Player(name: "Jofra Archer", image: UIImage(named: "Jofra Archer")),
            Player(name: "Chris Woakes", image: UIImage(named: "Chris Woakes")),
            Player(name: "Adil Rashid", image: UIImage(named: "Adil Rashid")),
        ]
    }
}
