//
//  UsersViewController.swift
//  movieRater
//
//  Created by Dylan Sharkey on 5/22/17.
//  Copyright © 2017 Dylan Sharkey. All rights reserved.
//

import UIKit
import Firebase


class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var ref: FIRDatabaseReference!
    var users: [NSDictionary] = [NSDictionary]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        ref = FIRDatabase.database().reference()
        ref.child("Users").observeSingleEvent(of: .value, with: { (jsonData) in
            self.users = jsonData.value as! [NSDictionary]
            self.tableView.reloadData()
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "userDetails", sender: indexPath)
    }
    
    
    @IBAction func ProfileButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "profile", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "userDetails") {
            let indexPath = sender as! IndexPath
            let destination = segue.destination as! UserDetailViewController
            destination.userData = users[indexPath.row]
        }
        if(segue.identifier == "profile") {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserCell
        let user: NSDictionary = users[indexPath.row]
        cell.userName?.text = user["Name"] as? String
        return cell
    }
}
