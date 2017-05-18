//
//  MovieDetailsViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/15/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailsViewController: UIViewController {
   
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieDescription: UILabel!
    
    var movieData: NSDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = movieData!["title"] as? String
        movieDescription.text = movieData!["overview"] as? String
        GetPosterImage(ForUrl: movieData!["poster_path"] as? String)
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    private func GetPosterImage(ForUrl str: String?) {
        if(str != nil) {
            let base = "https://image.tmdb.org/t/p/w500"
            Alamofire.request((base + str!)).responseData(completionHandler: {
                data in
                DispatchQueue.main.async {
                    self.movieImage.image = UIImage(data: data.value!)
                }
            })
        }
    }
}
