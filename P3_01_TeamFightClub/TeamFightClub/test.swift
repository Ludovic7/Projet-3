//
//  test.swift
//  TeamFightClub
//
//  Created by Ludovic DANGLOT on 18/03/2021.
//

import Foundation

final class Garage {
    
    // MARK: - Vars
    
    private var voitures = [Voiture]()
    private let boucleInfinie = true
    
    // MARK: - Methodes
    
    func start() {
        var choixUtilisateur = 0
        repeat {
            accueil()
            repeat {
                if let data = readLine() {
                    if let dataToInt = Int(data) {
                        choixUtilisateur = dataToInt
                    }
                }
            } while choixUtilisateur != 1 && choixUtilisateur != 2 && choixUtilisateur != 3
            
            switch choixUtilisateur {
                case 1:
                    ajouterVehicule()
                case 2:
                    etatDuGarage()
                case 3:
                    videGarage()
                default:
                    break
            }
            choixUtilisateur = 0
        } while boucleInfinie
    }
    
    // Interface d'accueil
    private func accueil() {
        print("")
        print("===============================")
        print("Bienvenue dans mon garage!")
        print("1 - Ajouter un véhicule")
        print("2 - Etat du garage")
        print("3 - Sortir tous les véhicules")
        print("===============================")
    }
    
    // Interface d'ajout de véhicule
    private func ajouterVehicule() {
        var choixUtilisateur = 0
        
        print("")
        print("===============================")
        print("Choisissez le model à ajouter!")
        print("1 - Renault Clio")
        print("2 - BMW X5")
        print("3 - Mazda MX5")
        print("4 - Lotus Elise")
        print("===============================")
        
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choixUtilisateur = dataToInt
                }
            }
        } while choixUtilisateur != 1 && choixUtilisateur != 2 && choixUtilisateur != 3 && choixUtilisateur != 4
        
        switch choixUtilisateur {
            case 1:
                let renaultClio = RenaultClio()
                voitures.append(renaultClio)
            case 2:
                let bmwX5 = BmwX5()
                voitures.append(bmwX5)
            case 3:
                let mazdaMX5 = MazdaMX5()
                voitures.append(mazdaMX5)
            case 4:
                let lotusElise = LotusElise()
                voitures.append(lotusElise)
            default:
                break
        }
    }
    
    // Interface état du garage
    private func etatDuGarage() {
        if voitures.count > 0 {
            print("")
            print("===============================")
            for voiture in voitures {
                voiture.seDecrire()
            }
            print("===============================")
        } else {
            print("===============================")
            print("Le garage est vide!")
            print("===============================")
        }
    }
    
    // Interface du vide garage
    private func videGarage() {
        voitures.removeAll()
        print("")
        print("===============================")
        print("Le garage a été vidé!")
        print("===============================")
    }
}
