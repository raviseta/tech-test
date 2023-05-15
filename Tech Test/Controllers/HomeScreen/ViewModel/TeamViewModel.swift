//
//  TeamViewModel.swift
//  Tech Test
//
//  Created by Ravi Seta on 15/05/23.
//

import Foundation
import UIKit

protocol TeamViewModelProtocol {
    func filterPlayer(with name: String?)
    var currentTeam: TeamData? { get set }
    var currentTeamIndex: Int {get set}
    var teams: [TeamData] { get set}
}

class TeamViewModel: TeamViewModelProtocol {
    
    // MARK: - Properties

    var currentTeamIndex: Int = 0
    var teams: [TeamData] = []
    
    private var teamsDataSource: [TeamData] = [] {
        didSet {
            teams = teamsDataSource
        }
    }
    var currentTeam: TeamData? = nil {
        didSet {
            self.refreshPlayers()
        }
    }
    
    // MARK: - Init

    init() {
        self.prepareTeams()
    }
    
    // MARK: - Setup

    private
    func prepareTeams() {
        self.teamsDataSource = [
            TeamData(teamName: "India", countryFlag: UIImage(named: "India"), players: India.players),
            TeamData(teamName: "Australia", countryFlag: UIImage(named: "Australia"), players: Australia.players),
            TeamData(teamName: "England", countryFlag: UIImage(named: "England"), players: England.players),
        ]
        //TODO: - Ideally UIImage should not be in viewmodel. We can remove after actual API integation.
        self.currentTeam = self.teamsDataSource.first
    }
    
    private
    func refreshPlayers() {
        if let index = teamsDataSource.lastIndex(where: { $0.teamName == (self.currentTeam?.teamName ?? "") }) {
            self.currentTeamIndex = index
        }
    }
    
    func filterPlayer(with name: String?) {
        guard let name = name, !name.isEmpty else {
            self.teams = teamsDataSource
            return
        }
        
        var filteredTeam: TeamData?
        
        let filtered = teamsDataSource.filter { team in
            return team.teamName == (currentTeam?.teamName ?? "")
        }
        
        for team in filtered {
            let filteredPlayer = team.players.filter({ $0.name.lowercased().contains(name.lowercased()) })
            filteredTeam = TeamData(
                teamName: team.teamName,
                countryFlag: team.countryFlag,
                players: filteredPlayer
            )
        }
        
        guard
            let index = self.teams.firstIndex(where: { $0.teamName == (currentTeam?.teamName ?? "") }),
            let filteredTeam = filteredTeam
        else {
            self.teams = teamsDataSource
            return
        }
        self.teams[index] = filteredTeam
    }
}
