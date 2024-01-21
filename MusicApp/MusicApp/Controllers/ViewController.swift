//
//  ViewController.swift
//  MusicApp
//
//  Created by 정우찬 on 2024/01/18.
//

import UIKit

class ViewController: UIViewController {
    
    private let musicTableView = UITableView()
    
    var musicArrays: [Music] = []
    var networkManager = NetworkManager.shared
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupSearchBar()
        setupTableView()
        setupData()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Music Search"
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
        musicTableView.register(MusicCell.self, forCellReuseIdentifier: Cell.musicCellIdentifier)
        
        view.addSubview(musicTableView)
        
        musicTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            musicTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            musicTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            musicTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            musicTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupData() {
        networkManager.fetchMusic(searchTerm: "jazz") { result in
            switch result {
            case .success(let musicData):
                self.musicArrays = musicData
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArrays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = musicTableView.dequeueReusableCell(withIdentifier: Cell.musicCellIdentifier, for: indexPath) as! MusicCell
        
        cell.imageUrl = musicArrays[indexPath.row].imageUrl
        cell.songNameLabel.text = musicArrays[indexPath.row].songName
        cell.artistNameLabel.text = musicArrays[indexPath.row].artistName
        cell.albumNameLabel.text = musicArrays[indexPath.row].albumName
        cell.releaseDateLabel.text = musicArrays[indexPath.row].releaseDateString
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
        self.musicArrays = []
        
        networkManager.fetchMusic(searchTerm: text) { result in
            switch result {
            case .success(let data):
                self.musicArrays = data
                DispatchQueue.main.async {
                    self.musicTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        self.view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.musicArrays = []
        self.musicTableView.reloadData()
        self.view.endEditing(true)
    }
}
