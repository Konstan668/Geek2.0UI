//
//  FriendsViewController.swift
//  VKAPP
//
//  Created by Konstantin on 26.08.2021.
//

import UIKit


final class FriendsViewController: UIViewController {
    let userStorage: UserAndGroupsStorage = UserAndGroupsStorage()
    var usersArray: [User] = [User]()
    var indexArray:[String] = [String]()
    var usersDictionary =  [String: [User]]()
    
    
    
    
    
    
    @IBAction func exitButtonPressed(_ sender: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true)
    }
    
    @IBOutlet weak var FriendsTableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        sortUsers(userStorageInFunc: userStorage)
        makeIndexArray(userArrayInFunc: usersArray)
        addKeys(indexArray: indexArray)
        addUserByKeys(usersArrayInFunc: usersArray)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FriendsTableView.delegate = self
        FriendsTableView.dataSource = self
    }
    
    func sortUsers(userStorageInFunc: UserAndGroupsStorage) {
        usersArray = userStorageInFunc.users
        usersArray.sort{$0.userName < $1.userName}
        print(usersArray)
    }
    
    func makeIndexArray(userArrayInFunc: [User]) {
        for user in usersArray {
            if !indexArray.contains(user.index){
                indexArray.append(user.index)
            }
        }
    }
    
    func addKeys(indexArray: [String]) {
        let emptyUserArray = [User]()
        for index in indexArray {
            usersDictionary.updateValue(emptyUserArray, forKey: index)
        }
    }
    
    func addUserByKeys(usersArrayInFunc: [User]) {
        for user in usersArrayInFunc {
            usersDictionary[user.index]?.append(user)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return indexArray.count
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArray[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let x = usersDictionary[indexArray[indexPath.section]]
        let x2 = x![indexPath.row]
        performSegue(withIdentifier: "photosSegue", sender:x2)
        
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "photosSegue" else { return }
        guard let destination = segue.destination as? PhotosViewController else { return }
        let row = sender as! User
        destination.users = row
        
    }
    
    
    
}



extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usersDictionary[indexArray[section]]!.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  FriendsTableViewCell.identifier) as! FriendsTableViewCell
        let x = usersDictionary[indexArray[indexPath.section]]
        let x2 = x![indexPath.row]
        cell.configure(user: x2)
        return cell
    }
    
}



