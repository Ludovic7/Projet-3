//
//  Description.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 18/03/2021.
//

import Foundation

// class mere Player
class Player {
    
    // MARK: - PROPERTIES
    
    let name : String
    // variable characters faisant appel au dictionnaire Character
    var characters : [Character] = []
    // variable uniqueNames faisant appel a un dictionnaire
    static var uniqueNames : [String] = []
    
    // MARK: - INIT
    
    /// Initialisation de la classe Player
    init(name: String){
        self.name = name
        createCharacters()
    }
    
    // MARK: - METHODE
    
    /// fonction isDead en booleen, si different de isDead dans player il sort sinon la personne est morte
    func isDead() -> Bool {
        for character in characters {
            if !character.isDead(){
                return false
            }
        }
        return true
    }
    
    /// Creation de 3 personnages a selectionner puis vu de l'equipes selectionner
    func createCharacters (){
        print("")
        print("Equipe \(name)\nCelle ci sera constitué de trois personnes \nA toi de les choisir parmi la liste suivant :")
        
        for _ in 0 ..< 3 {
            print("1 - Le Boxeur"
                    + "\n2 - Le Docteur"
                    + "\n3 - Le Cracheur de Feu")
            var choice = 0
            while choice != 1 && choice != 2 &&  choice != 3 {
                if let data = readLine() {
                    if let dataToInt = Int(data) {
                        choice = dataToInt
                    }
                }
            
            switch choice {
            case 1:
                let theBoxer = TheBoxer(name: createName())
                characters.append(theBoxer)
            case 2:
                let theDoctor = TheDoctor(name: createName())
                characters.append(theDoctor)
            case 3:
                let theFireEater = TheFireEater(name: createName())
                characters.append(theFireEater)
            default:
                print("Toujours du mal pour appuyer sur les chiffres qui sont indiquer?")
                break
            }
            }
        }
        viewTeam()
    }
    
    /// visibilité de l'equipe entiére
    public func viewTeam() {
        print("Tes trois combatants sont :")
        for character in characters {
            print("Je m'appelle \(character.name) et \(character.scream)Je dispose de \(character.life) de point de vie et je suis equipé de \(character.sayWeapon())")
        }
    }
    
    /// creation du nom du personnage avec un nom unique
    func createName () -> String {
        print("Quel est son nom?")
        var name = ""
        while name == "" {
            if let currentName = readLine() {
                if Player.uniqueNames.contains(currentName) {
                    print("Tu ne peux pas utilisé le meme nom deux fois.")
                } else {
                    name =  currentName
                    Player.uniqueNames.append(currentName)
                }
            }
        }
        return name
    }
    
    /// indique les personnages et leurs characteristique ou si ils sont mort
     func description(){
        for (index, character) in characters.enumerated() {
            if character.life <= 0 || character.life >= 200 {
                print("\(character.name) est mort")
            } else {
                    print("\(index+1) - \(character.name); point de vie : \(character.life) pts; degats : \(character.weapon.damages); soigne : \(character.weapon.heal) ")
                
            }
        }
    }
}



