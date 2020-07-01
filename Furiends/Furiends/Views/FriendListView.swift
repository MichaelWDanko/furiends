//
//  FriendListView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

//class Settings: ObservableObject {
//    <#code#>
//}


struct FriendListView: View {   
    
    @EnvironmentObject var dataModel: FuriendModel
    
    @State private var displayAddFriendSheet = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                List {
                    ForEach(self.dataModel.petList) { pet in
                        HStack {
                            Spacer()
                            FriendListRow(
                                name: pet.name,
                                breed: pet.breed,
                                screenWidth: geo.size.width,
                                randomPic: Int.random(in: 1...2)
                            )
//                            FriendView(
//                                name: self.dataModel.petList[pet].name,
//                                breed: self.dataModel.petList[pet].breed,
//                                screenWidth: geo.size.width)
                            Spacer()
                        }
                    }
                }// End of ScrollView
                .navigationBarTitle(Text("Furiends"))
                    .navigationBarItems(trailing: Button(action: self.showAddFriend) {
                    Image(systemName: "plus")
                }
                
                )
                .sheet(isPresented: self.$displayAddFriendSheet) {
                    AddFriendView(FriendDataModel: self.dataModel)
                }
                
            }// End of NavigationView
        }// End of GeometryReader geo1
    }// End of body
    
    func showAddFriend() {
        self.displayAddFriendSheet.toggle()
//        self.dataModel.addFriend(name: "Jax", breed: "Doodle")
//        print(dataModel.petList)
        
    }// Enf of showAddFriend
    
}// End of FriendListView


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
