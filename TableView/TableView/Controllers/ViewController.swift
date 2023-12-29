//
//  ViewController.swift
//  TableView
//
//  Created by 정우찬 on 2023/12/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        title = "영화목록"
        
        movieDataManager.makeMovieData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        let array = movieDataManager.getMovieData()
        
        cell.mainImageView.image = array[indexPath.row].movieImage
        cell.movieNameLabel.text = array[indexPath.row].movieName
        cell.descriptionLabel.text = array[indexPath.row].movieDescription
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
            
            detailVC.movieData = movieDataManager.getMovieData()[indexPath.row]
        }
    }
}
