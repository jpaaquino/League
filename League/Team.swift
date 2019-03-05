//
//  Team.swift
//  League
//
//  Created by Joao Paulo Aquino on 05/03/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import Foundation

class Team {
    let name: String
    var pts: Int = 0
    var games: Int {
        return wins + draws + losses
    }
    var wins: Int = 0
    var draws: Int = 0
    var losses: Int = 0
    var plus: Int = 0
    var minus: Int = 0
    var plusMinus: Int {
    return plus - minus
    }
    
    func calculatePts(ptsW: Int, ptsD: Int, ptsL: Int){
        pts = wins * ptsW + draws * ptsD + losses * ptsL
    }
    
    init(name: String){
        self.name = name
    }
}
