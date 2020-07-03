//
//  DataModel.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

enum PetGender: String, CaseIterable {
    case male = "Male"
    case female = "Female"
}

struct Pet: Identifiable, Equatable {
    var id = UUID().uuidString
    var name: String
    var breed: String
    var owner: String
    var gender: PetGender
}

class FuriendModel: ObservableObject {
    
    @Published var petList = [Pet]()
    
    func addFriend(name: String, breed: String, owner: String, gender: PetGender) {
        petList.append(Pet(
            name: name,
            breed: breed,
            owner: owner,
            gender: gender
        ))
    }
    
    func removeFriendWithIdentifier(of id: String) {
        let index: Int? = petList.firstIndex() {
            $0.id == id
        }
        if let unwrappedIndex = index {
            petList.remove(at: unwrappedIndex)
        } else {
            fatalError("Tried to remove an item from the array of petList without an index for the UUID.")
        }
    }
    
    init() {
        petList.append(Pet(name: "Woofer", breed: "Dawg", owner: "Human", gender: PetGender.male))
        petList.append(Pet(name: "Floofer", breed: "Dawg", owner: "Human", gender: PetGender.female))
        petList.append(Pet(name: "Jax", breed: "Dawg",  owner: "Human", gender: PetGender.male))
//        petList.append(Pet(name: "Dooper", breed: "Dawg"))
//        petList.append(Pet(name: "Booper", breed: "Dawg"))
    }
}
