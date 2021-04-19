//
//  Game2.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 18/03/2021.
//

import Foundation

func addNewTeam() {
    print("Qu’avez-vous fait aujourd'hui?"
        + "\n1. 🥕  J’ai nourri mes animaux"
        + "\n2. 💰  J’ai vendu mes produits"
        + "\n3. 🐄  J’ai trait mes vaches"
        + "\n4. 🌾  J’ai moissonné"
        + "\n5. 🐑  J’ai tondu mes moutons")

    // On récupère la réponse de l'utilisateur
    if let choice = readLine() {
        switch choice {
        case "1": // Nourrir les animaux
            feedAnimals()
        case "2": // Vendre les produits
            sell()
        case "3": // Traire les vaches
            milkCows()
        case "4": // Moissonner
            harvest()
        case "5": // Tondre les moutons
            mowSheep()
        default:
            print("Je ne comprends pas")
        }

        print("🎉  Super 🎉")
    }
}
