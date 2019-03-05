//
//  League.swift
//  League
//
//  Created by Joao Paulo Aquino on 05/03/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

class League {
    
    init(teams: [Team]) {
        self.teams = teams
    }
    
    var ptsW = 3
    var ptsD = 1
    var ptsL = 0
    
    var teams:[Team]
    var games: [Game] = []
    
    func playGames(){
        for game in games {
            game.finalScore()
        }
        for team in teams {
            if(team.name != ""){
            team.calculatePts(ptsW: ptsW, ptsD: ptsD, ptsL: ptsL)
            print("\(team.name) \(team.pts)")
            
            }
        }
        teams = teams.sorted(by: { $0.pts > $1.pts })
        print("O campeão é \(teams[0].name) com \(teams[0].pts) pontos")
    }
    
    func createSchedule() -> [Game]{
        
        let rounds = teams.count % 2 == 0 ? teams.count - 1 : teams.count
        self.teams.append(Team(name: ""))
        var games: [Game] = []
        
        for _ in 1 ... rounds{
            let teams1 = teams.prefix(teams.count/2)
            let teams2 = Array(teams.suffix(teams.count/2).reversed())
            for (index,team) in teams1.enumerated(){
                let team2 = teams2[index]
                if(team.name != "" && team2.name != ""){
                    let game = Game(team1: team, team2: team2)
                    game.team1Score = Int.random(in: 0 ... 8)
                    game.team2Score = Int.random(in: 0 ... 8)
                    print("\(game.team1.name) \(game.team1Score) vs \(game.team2.name) \(game.team2Score)")
                    games.append(game)
                }
            }
            teams.insert(teams.popLast()!, at: 1)
            
        }
        
        
        return games
    }
}




