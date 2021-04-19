//
//  chest.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 12/04/2021.
//

import Foundation

class Chest {
    
    // MARK: - METHODE
    
    /// fonction coffre aleatoire ayant pour reference la class charactere
    func open(character:Character){
        // variable tirage aleatoire d'un dés a 19faces
        let randomChest = Int.random(in: 1..<20)
        // condition "If" le chiffre tiré entre egale ou superieur 16 et inferieur a 20
        if randomChest >= 12 {
            print("")
            print("Felicitation")
            print("Tu viens de trouvé un coffre.")
            print("Tu es equipé d'une nouvelle arme ")
            // condition "If" si dans character le type est egale à The boxer alors il a une nouvelle arme
            if character.type == "The Boxer"{
                // condition "If" si il avait comme arme Poing Americain il change d'amrme
                if character.weapon.name == "Poing Americain" {
                    character.weapon = Knife()
                    print("Tu es maintenant equipé d'un couteau avec \(character.weapon.damages) points de degats")
                    print("")
                }else {
                    // sinon il recupére son ancienne arme
                    character.weapon = BrassKnuckles()
                    print("Tu es maintenant equipé d'un poing american avec \(character.weapon.damages) points de degats")
                    print("")
                }
            }
            // condition "If" si dans character le type est egale à The Doctor alors il a une nouvelle arme
            if character.type == "The Doctor"{
                // condition "If" si il avait comme arme Seringue il change d'amrme
                if character.weapon.name == "Seringue " {
                    character.weapon = Infusion()
                    print("Tu es maintenant equipé d'une perfusion avec \(character.weapon.heal) points de soin")
                    print("")
                }else {
                    // sinon il recupére son ancienne arme
                    character.weapon = Needle()
                    print("Tu es maintenant equipé d'une seringue avec \(character.weapon.heal) points de soin")
                    print("")
                }
            }
            // condition "If" si dans character le type est egale à The Fire Eater alors il a une nouvelle arme
            if character.type == "The Fire Eater"{
                // condition "If" si il avait comme arme Eau de Feu il change d'amrme
                if character.weapon.name == "Eau de Feu" {
                    character.weapon = Gaz()
                    print("Tu es maintenant equipé de gaz avec \(character.weapon.damages) points de degats")
                    print("")
                }else {
                    // sinon il recupére son ancienne arme
                    character.weapon = FireWater()
                    print("Tu es maintenant equipé d'eau de feu avec \(character.weapon.damages) points de degats")
                    print("")
                }
            }
        }
    }
}
