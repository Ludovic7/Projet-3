  
  //
  //  Game.swift
  //  TeamFightClub
  //
  //  Created by Ludovic DANGLOT on 17/03/2021.
  //
  
  import Foundation
  
  class Game {
    
    // MARK: -PROPERTIES
    
    // variable players faisant appel au dictionnaire Player
    private var players = [Player]()
    // variable pour le nombre de tour
    private var numberOfTurn = 0
    
    // fonction de mise en marche du jeu
    public func start() {
        createPlayers()
        battle ()
        checkWinner()
    }
    
    // MARK: - METHODE
    
    /// debut du jeu et creation des deux equipes et personnages
    private func createPlayers() {
        // Description au debut du jeu
        print("")
        print("Salutation a vous jeunes bagarreurs!!!")
        print("Vous etes ici dans Team Fight Club!")
        print("Connaissez vous les regles :")
        print("1 - Oui")
        print("2 - Si vous hesitez c'est que vous les ne conaissez pas, n'est ce pas?")
        print("")
        
        // fonction de choix d'un numero entre 1 et 2
        var choice = 0
        while choice != 1 && choice != 2 {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
            
            // boucle du choix urtilisateur
            switch choice {
            // choix 1 pour lancement du jeu
            case 1:
                print("J'en etais sur que vous faisiez deja parti du club.")
                print("Commençons alors!")
                print("Maintenant place au jeu! ")
                
                // boucle tournant 2 fois pour le choix du nom d'equipe (equipe 1 et 2)
                for _ in 0 ..< 2 {
                    print("Comment s'appelle ton equipe?")
                    var name = ""
                    while name == "" {
                        if let data = readLine() {
                            name = data
                        }
                    }
                    // ajout du nom de l'equipe choisi lors de la boucle dans le tableau players ainsi que la selaction des personnages
                    let player = Player (name: name)
                    players.append(player)
                }
                
            // description des regles
            case 2:
                print("La première règle du Team Fight Club est :"
                        + "\n- Il est interdit de parler du Team Fight Club."
                        + "\n- La seconde règle du Fight Club est : il est interdit de parler du Team Fight Club."
                        + "\n- Troisième règle du Fight Club : quelqu'un appuie sur la mauvaise touche, quelqu'un joue alors que ce n'est pas son tour, quelqu'un essaye de modifier mon code, le jeu est terminé.")
                start()
                
            default:
                print("Sais tu vraiment appuyer sur 1 ou 2?? il vaudrait mieux, ça va te servir tout au long du jeu!")
                start()
            }
        }
        
    }
    /// fonction battle, lance les combats
    private func battle () {
        print("Maintenant que les equipes sont faite place a la castagne")
        // boucle infini
        while true {
            numberOfTurn += 1
            // boucle tournant 2 fois pour l'attaque d'une equipe pui l'autres
            for i in 0..<2 {
                
                print("")
                print("Equipe \(players[i].name)") // nom de l'equipe qui va attaquer
                print("Qui desire tu faire attaquer?")
                players[i].description() // description des differents personnages de l'equipe
                
                // choix du perso pour l'attaque
                let ally = userChoiceDead(indexTeam: i) // choix du personnage qui est definie comme ally
                Chest().open(character: ally) // appel de la fonction Chest pour l'ally
                
                // variable enemyIndex, detection de l'enemy par la valeur de i
                var enemyIndex = 0
                if i == 0 {
                    enemyIndex = 1
                }else {
                    enemyIndex = 0
                }
                // condition "SI" pour soigner ou attaquer
                if let theDoctor = ally as? TheDoctor{
                    print ("Qui desire tu soigner?")
                    players[i].description()
                    // choix du perso pour recevoir le soin
                    let teammate = userChoiceDead(indexTeam: i)
                    theDoctor.heal(target: teammate) // soin reçu
                    print("\(ally.name) soigne \(ally.name) et lui restaure \(ally.weapon.heal) point de vie")
                }else {
                    print("Qui desire tu attaquer?")
                    players[enemyIndex].description()
                    
                    // choix du perso pour recevoir l'attaque
                    let enemy = userChoiceDead(indexTeam: enemyIndex)
                    
                    // attaque reçu
                    ally.attack(target: enemy)
                    print("\(ally.name) attaque \(enemy.name) et lui inflige \(ally.weapon.damages) point de degats")
                }
                // lecture du tableau des personnage pour savoir si ils sont en vie ou non
                //si il le sont nous sortons de la fonction battle grace au "return"
                if players[enemyIndex].isDead(){
                    return
                }
            }
        }
    }
    
    /// fonction choix du personnage si il n'est pas mort
    private func userChoiceDead(indexTeam:Int) -> Character {
        while true {
            let ally = players[indexTeam].characters[userChoice()-1]
            // condition "SI" personnage entre 0 et 200 point de vie
            if ally.life > 0 && ally.life < 200 {
                return ally
            } else {
                print("Ce personnage est mort")
            }
        }
    }
    
    // fonction de choix d'un numero entre 1, 2 et 3
    private func userChoice()-> Int {
        var choice = 0
        while choice != 3 && choice != 1 && choice != 2 {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    choice = dataToInt
                }
            }
        }
        // sortie de la fonction si 1,2 et 3 n'est pas respecté
            return choice
    }
    
    
    /// fonction pour voir qui est le gagnant
    func checkWinner() {
        // boucle "for" entre 0 et le nombre de joueurs
        for i in 0..<players.count {
            let team = players[i]
            var iIndex = 0
            if i == 0 {
                iIndex = 1
            }else {
                iIndex = 0
            }
            // condition "If" avec booleen si la condition est respecté alors affiché l'equipe gagnante
            if !team.isDead() {
                print("")
                print("La partie est fini")
                print("Vous avez joué \(numberOfTurn) tour")
                print("- Equipe \((players[i].name)) : tu as gagnée ! ")
                players[i].description()
                print("")
                print("- Equipe \(players[iIndex].name) : tu as perdu ! ")
                players[iIndex].description()
                
            }
        }
    }
  }
  
  
  
  
  
  
  
  
  
  
