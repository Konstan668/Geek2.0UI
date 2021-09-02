//
//  UserAndGroupsStorage.swift
//  VKAPP
//
//  Created by Konstantin on 31.08.2021.
//

import Foundation

class UserAndGroupsStorage {
    var users: [User]
    var groups: [Group]
    
    init() {
        self.users = [User(userName: "Sergey", userImageName: "SergeyLogo", userPhothosName: ["Serg2","Serg3"]),
                      User(userName: "Andrey", userImageName: "AndreyLogo", userPhothosName: ["Andr1", "Andr2", "Andr3"])]
        
        self.groups = [Group(groupName: "MDK", groupImage: "MDKLogo"),
                       Group(groupName: "Leprum", groupImage: "LeprumLogo")]
    }
}

