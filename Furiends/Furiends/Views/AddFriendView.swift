//
//  AddFriendView.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct AddFriendView: View {
    @Environment(\.presentationMode) var isPresented
    @ObservedObject var FriendDataModel: FuriendModel
    
    @State private var newPetName = ""
    @State private var newPetBreed = ""
    @State private var newPetOwnerName = ""
    @State private var isMaleToggle = true
    
    private var genderToggleLabel: String {
        isMaleToggle ? "Male" : "Female"
    }
    private var newPetGender: PetGender {
        isMaleToggle ? PetGender.male : PetGender.female
    }
    
    let petGenders = ["Male", "Female"]
    @State private var petGenderSelection = 0
    

    var body: some View {
        
        GeometryReader { geo in
            Form {
                Section(header: Text("Pet Details")) {
                    TextField("Name", text: $newPetName)
                    TextField("Breed", text: $newPetBreed)
                    Picker(selection: $petGenderSelection, label: Text("Gender")) {
                        ForEach(petGenders, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())


                }
                
                Section(header: Text("Breed")) {
                    Toggle(genderToggleLabel, isOn: $isMaleToggle)
                }
                
                
                Section(header: Text("Owner Details")) {
                    TextField("Name", text: $newPetOwnerName)
                }
                
                Section {
                    
                    Button(action: saveFriend) {
                        Text("Save Furiend")
                            .multilineTextAlignment(.center)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                }// End of Section
            }// End of Form
            .navigationTitle(Text("Add Friend"))
            .navigationBarTitleDisplayMode(.inline)
        }// End of GeometryReader geo
    }// End of body
    
    func saveFriend() {
        print(FriendDataModel.petList)
        FriendDataModel.addFriend(name: newPetName,
                                  breed: newPetBreed,
                                  owner: newPetOwnerName,
                                  gender: newPetGender)
        self.newPetName = ""
        self.newPetBreed = ""
        self.newPetOwnerName = ""
        self.isPresented.wrappedValue.dismiss()
    }
    
}// End of AddFriendView

//struct AddFriend_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFriendView()
//    }
//}
