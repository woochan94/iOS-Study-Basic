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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupNavigationBar()
        setupTableView()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Title"
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
