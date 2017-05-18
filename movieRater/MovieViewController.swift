//
//  ViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/15/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import Alamofire

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var tableData: NSArray = NSArray()
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if(textField.text != "") {
            let parsedText: String = textField.text!.replacingOccurrences(of: " ", with: "+")
            SearchMovieDb(ForTitle: parsedText)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell
        let movieInfo = tableData[indexPath.row] as! NSDictionary
        cell.movieTitle.text = movieInfo["title"] as? String
        cell.movieRating.text = "Rating: \(movieInfo["vote_average"]!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "movieInfo", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieInfo" {
            let nav = segue.destination as! UINavigationController
            let detailsView = nav.topViewController as! MovieDetailsViewController
            let indexPath = sender as! IndexPath
            detailsView.movieData = tableData[indexPath.row] as? NSDictionary
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func SearchMovieDb(ForTitle str: String) {
        let base = "http://api.themoviedb.org/3/search/movie?api_key="
        let apiKey = KeychainService.loadKey() as! String
        let query = "&query=" + str
        Alamofire.request((base + apiKey + query)).responseJSON(completionHandler: {
            response in
            let JSON = response.result.value  as! NSDictionary
            self.tableData = JSON["results"] as! NSArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
