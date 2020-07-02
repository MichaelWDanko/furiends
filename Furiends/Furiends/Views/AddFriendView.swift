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
    @State private var newPetOwnerName = ""
    @Environment(\.presentationMode) var isPresented
    
    var body: some View {
        
        GeometryReader { geo in
            Form {
                
                Section {
                    Button(action: saveFriend, label: {
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "plus.circle")
                                    
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width / 7)
                                Text("Add Picture")
                                    .font(.headline)
                            }
                            Spacer()
                        }
                    })// End of Button
                    
                    
                }
                
                Section(header: Text("Pet Details")) {
                    TextField("Name", text: $newPetName)
                    TextField("Breed", text: $newPetBreed)
                    
//MARK: TODO Add SegmentedPickerStyle
//Seems like a bug in SegmentedPickerStyle()
//
//                    TextField("Behavior")
//                    Picker("Pet Behavior", selection: $petBehaviorSelection) {
//                        ForEach(behaviors, id: \.self) { selection in
//                            Text(selection)
//                        }
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
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
        }// End of GeometryReader geo
    }// End of body
    
    func saveFriend() {
        print(FriendDataModel.petList)
        FriendDataModel.addFriend(name: newPetName, breed: newPetBreed, owner: newPetOwnerName)

        
        
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
