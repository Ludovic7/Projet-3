//
//  Description player.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 18/03/2021.
//

import Foundation
// class mere Charactere
class Character {
    
    // MARK: - PROPERTIES
    
    // differentes variables indiquant les proprietés des personnages du jeux
    let type : String
    let name : String
    let scream : String
    var life : Int
    var weapon : Weapon
    
    // MARK: - INIT
    
    // Initialisation de la classe Charactere
    init(type: String,name: String, scream: String, life: Int, weapon : Weapon){
        self.type = type
        self.name = name
        self.scream = scream
        self.life = life
        self.weapon = weapon
    }
    
    // MARK: - METHODE
    
    /// fonction attack permet a l'arme d'enlever des points de vie
    func attack (target : Character) {
        target.life -= weapon.damages
    }
    
    /// fonction isDead, lecture de la vie d'un joueur pour l'indentifir isDead ou non
    func isDead() -> Bool {
        return life <= 0 || life >= 200
    }
    
    /// fonction sayWeapon, elle indique si l'arme sera pour soigner ou attaquer
    func sayWeapon() -> String {
        if ((self as? TheDoctor) != nil) {
            return "\(weapon.name) qui soigne \(weapon.heal) de point de vie"
        }else{
            return "\(weapon.name) qui cause \(weapon.damages) de degats"
        }
    }
}

// MARK: - CLASS

// class fille TheBoxer appartenant a la class mere Character
class TheBoxer : Character {
    init(name : String){
        super.init(type : "The Boxer",name: name, scream: "la castagne c'est mon truc, je cours droit dedans! ", life: 80, weapon: BrassKnuckles())
    }
}

// class fille TheDoctor appartenant a la class mere Character
class TheDoctor  : Character {
    init(name : String){
        super.init(type : "The Doctor",name: name, scream: "la santé c'est mon metier mais que pour mes coequipiers. Pour mes adversaires c'est la mort! ", life: 110, weapon: Needle())
    }
    //fonction heal permet a l'arme d'ajouter des points de vie
    func heal (target : Character) {
        target.life += weapon.heal
    }
}

// class fille TheFireEater appartenant a la class mere Character
class TheFireEater : Character {
    init(name : String){
        super.init(type : "The Fire Eater",name: name, scream: "j'adore le feu, mais il y a toujours un moment ou ça derape, alors reste pas trop prés! ", life: 90, weapon: FireWater())
    }
}


