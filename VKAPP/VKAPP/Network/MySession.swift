//
//  MySession.swift
//  VKAPP
//
//  Created by Konstantin on 26.10.2021.
//

import UIKit

class MySession {
    static let instance = MySession()
    
    private init () {}
    
    var token: String = ""
    var userId: Int = 0
}
