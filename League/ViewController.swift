//
//  ViewController.swift
//  League
//
//  Created by Joao Paulo Aquino on 05/03/19.
//  Copyright © 2019 Joao Paulo Aquino. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    @IBOutlet weak var teamOneLabel: UILabel!
    @IBOutlet weak var teamTwoLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    var league: League!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.create()
        tableView.reloadData()
        
    }
    
    func create(){
        //    let teams = ["Brasil","Argentina","Uruguai","Paraguai","Chile","Equador","Venezuela","Bolivia","Peru","Colombia","Alemanha","Espanha","Italia","França","Inglaterra","Holanda","Portugal","Belgica","Croacia","Panama"]
        let teams = ["Brasil","Argentina","Inglaterra","Holanda","Portugal","Belgica","Croacia"]
        
        var teams2:[Team] = []
        for team in teams {
            teams2.append(Team(name: team))
        }
        
        league = League(teams: teams2)
        league.games = league.createSchedule()
        league.playGames()
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return league.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! GameCell
        let game = league.games[indexPath.row]
        cell.teamOneLabel.text = game.team1.name
        cell.teamTwoLabel.text = game.team2.name
        
        return cell
    }
    



}

