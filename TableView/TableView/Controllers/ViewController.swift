//
//  ViewController.swift
//  TableView
//
//  Created by 정우찬 on 2023/12/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        return cell
    }
    
}
