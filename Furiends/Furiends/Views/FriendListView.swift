//
//  ContentView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var FriendDataModel = FriendModel()
    
    @State private var displayAddFriendSheet = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    ForEach(0..<self.FriendDataModel.petList.count) { pet in
                        HStack {
                            Spacer()
                            FriendView(
                                name: self.FriendDataModel.petList[pet].name,
                                breed: self.FriendDataModel.petList[pet].breed,
                                screenWidth: geo.size.width)
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
                        AddFriendView()
                }
                
            }// End of NavigationView
        }// End of GeometryReader geo1
    }// End of body
    
    func showAddFriend() {
        self.displayAddFriendSheet.toggle()
    }
}// End of FriendListView


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
