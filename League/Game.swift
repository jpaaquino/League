//
//  Game.swift
//  League
//
//  Created by Joao Paulo Aquino on 05/03/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

class Game {
    let team1: Team
    let team2: Team
    var team1Score:Int = 0
    var team2Score: Int = 0
    
    init(team1: Team, team2: Team) {
        self.team1 = team1
        self.team2 = team2
    }
    
    func finalScore(){
        if(team1Score > team2Score){
            team1.wins += 1
            team2.losses += 1
        }else if(team1Score == team2Score){
            team1.draws += 1
            team2.draws += 1
        }else{
            team1.losses += 1
            team2.wins += 1
        }
    }
}
