//
//  FriendsViewController.swift
//  VKAPP
//
//  Created by Konstantin on 26.08.2021.
//

import UIKit

final class FriendsViewController: UIViewController {
    let userStorage: UserAndGroupsStorage = UserAndGroupsStorage()
    
    
    @IBAction func exitButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true)
    }
    
    @IBOutlet weak var FriendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "photosSegue", sender: indexPath.row)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "photosSegue" else { return }
        guard let destination = segue.destination as? PhotosViewController else { return }
        let row = sender as! Int
        destination.users = userStorage.users[row]
        
    }
    
}



extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userStorage.users.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  FriendsTableViewCell.identifier) as! FriendsTableViewCell
        
        cell.configure(user: userStorage.users[indexPath.row])
        return cell
    }
    
}



