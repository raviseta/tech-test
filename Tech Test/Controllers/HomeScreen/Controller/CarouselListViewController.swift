//
//  CarouselListViewController.swift
//  Tech Test
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

class CarouselListViewController: UIViewController {

    // MARK: - @IBOutlets
    
    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet private var tableHeaderView: UIView!
    
    // MARK: - Properties
    
    private var cellScale: CGFloat = 0.8
    private var teamViewModel: TeamViewModelProtocol = TeamViewModel()
    private var sectionHeader: TableViewSectionSearchBarHeaderView?
    
    // MARK: - UIViewLifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - SetupView
    
    private
    func setupView() {
        self.title = teamViewModel.currentTeam?.teamName
        tableView.tableHeaderView = tableHeaderView
        tableView.registerReusableHeaderFooterView(TableViewSectionSearchBarHeaderView.self)
        setupFlowLayoutItemSize()
    }
    
    private
    func setupFlowLayoutItemSize() {
        
        guard let collectionLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let space: CGFloat = 12
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: space, bottom: 0, right: space)
        let itemWidth = collectionView.frame.size.width - space * 6
        collectionLayout.itemSize = CGSize(width: itemWidth, height: collectionView.frame.size.height)
        collectionLayout.minimumLineSpacing = space
    }

}

// MARK: - UITableView Delegate & datasource

extension CarouselListViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Setup Section
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if sectionHeader == nil {
            sectionHeader = tableView.dequeueReusableHeaderFooterView(type: TableViewSectionSearchBarHeaderView.self)
        }
        
        sectionHeader?.didSearch = { [weak self] searchText in
             guard let `self` = self else { return }
            DispatchQueue.main.async {
                self.teamViewModel.filterPlayer(with: searchText)
                self.tableView.reloadData()
            }
        }
        
        return sectionHeader
    }
    
    // SetupCell
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.teamViewModel.teams[teamViewModel.currentTeamIndex].players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarouselListTableViewCell.identifier) as? CarouselListTableViewCell
        else { fatalError(AppConstants.ErrorMessages.xibNotFound) }
        
        let team = self.teamViewModel.teams[teamViewModel.currentTeamIndex]
        let player = team.players[indexPath.row]
        cell.setup(player: player)
        
        return cell
    }
    
    // Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CollectionView DataSource & Delegates

extension CarouselListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // SetupCell
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamViewModel.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCollectionViewCell.identifier, for: indexPath) as? CarouselCollectionViewCell
        else { return UICollectionViewCell() }
        
        let team = teamViewModel.teams[indexPath.row]
        cell.setup(countryFlag: team.countryFlag)
        
        return cell
    }
}

// MARK: - ScrollView Delegates

extension CarouselListViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == self.collectionView {
            let index = Int(ceil(collectionView.contentOffset.x / UIScreen.main.bounds.width))
            guard index < self.teamViewModel.teams.count else { return }
            
            let team = self.teamViewModel.teams[index]
            self.teamViewModel.currentTeam = team
            self.title = team.teamName
            
            self.sectionHeader?.resetSearch()
            self.tableView.reloadData()
        }
    }
}
