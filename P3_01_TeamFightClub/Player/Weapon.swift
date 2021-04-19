//
//  File.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 19/03/2021.
//

import Foundation
// class mere Weapon
class Weapon {
    
    // MARK: - PROPERTIES
    
    var name : String
    let damages : Int
    let heal : Int
    
    // MARK: - INIT
    
    init(name: String, damages : Int, heal : Int) {
        self.name =  name
        self.damages = damages
        self.heal = heal
    }
}

// MARK: - CLASS

// class fille Brassknuckles appartenant a la class mere Weapon
class BrassKnuckles: Weapon {
    init() {
        super.init(name: "Poing Americain", damages: 40, heal : 0)
    }
}
// class fille Needle appartenant a la class mere Weapon
class Needle: Weapon {
    init() {
        super.init(name: "Seringue", damages: 0, heal: 20)
}
}
// class fille FireWater appartenant a la class mere Weapon
class FireWater: Weapon {
    init() {
        super.init(name: "Eau de Feu", damages: 30, heal: 0)
}
}
// class fille Knife appartenant a la class mere Weapon
class Knife: Weapon {
    init (){
        super.init(name: "Couteau", damages: 50, heal: 0)
    }
}
// class fille Infusion appartenant a la class mere Weapon
class Infusion: Weapon{
    init (){
        super.init(name: "Perfusion", damages: 0, heal: 30)
    }
}
// class fille Gaz appartenant a la class mere Weapon
class Gaz : Weapon {
    init() {
        super.init(name: "Essence", damages: 40, heal: 0)
    }
}




