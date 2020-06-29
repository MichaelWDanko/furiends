//
//  AddFriendView.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct AddFriendView: View {
    
    @ObservedObject var FriendDataModel: FuriendModel
    
    @State private var newPetName = ""
    @State private var newPetBreed = ""
    @Environment(\.presentationMode) var isPresented
    
    var body: some View {
        Form {
            VStack {
                TextField("Pet Name", text: $newPetName)
                TextField("Breed", text: $newPetBreed)
                Button(action: saveFriend) {
                    ZStack {
                        Color(.systemTeal)
                        Text("Save")
                    }
                }
            }
        }
    }
    
    func saveFriend() {
        print("Going to save a new friend!")
        print(FriendDataModel.petList)
        FriendDataModel.addFriend(name: newPetName, breed: newPetBreed)
        print("Saved a new friend!")
        print(FriendDataModel.petList)
        
        
        self.newPetName = ""
        self.newPetBreed = ""
        self.isPresented.wrappedValue.dismiss()
    }
    
}// End of AddFriendView

//struct AddFriend_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFriendView()
//    }
//}
