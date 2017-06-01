//
//  MovieListTableViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/25/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import Firebase

class MovieListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ref = FIRDatabase.database().reference()
//        ref.child("Users").observeSingleEvent(of: .value, with: { (jsonData) in
//            self.users = jsonData.value as! [NSDictionary]
//            self.tableView.reloadData()
//        })

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell") as! MovieListCell
        return cell
    }
}
