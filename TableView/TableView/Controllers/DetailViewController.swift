//
//  DetailViewController.swift
//  TableView
//
//  Created by 정우찬 on 2023/12/17.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }

}
