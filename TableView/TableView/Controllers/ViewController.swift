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
        tableView.delegate = self
        
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
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = moviesArray[indexPath.row]
        }
    }
}
