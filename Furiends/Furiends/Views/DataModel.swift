//
//  DataModel.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct Pet: Identifiable {
    var id = UUID().uuidString
    var name: String
    var breed: String
    var owner: String
}

class FuriendModel: ObservableObject {
    
    @Published var petList = [Pet]()
    
    
    func addFriend(name: String, breed: String, owner: String) {
        petList.append(Pet(name: name, breed: breed, owner: owner))
    }
    
    init() {
        petList.append(Pet(name: "Woofer", breed: "Dawg", owner: "Human"))
        petList.append(Pet(name: "Floofer", breed: "Dawg", owner: "Human"))
        petList.append(Pet(name: "Jax", breed: "Dawg",  owner: "Human"))
//        petList.append(Pet(name: "Dooper", breed: "Dawg"))
//        petList.append(Pet(name: "Booper", breed: "Dawg"))
    }
}
