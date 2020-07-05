//
//  FriendScrollView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

//class Settings: ObservableObject {
//    <#code#>
//}


struct FriendScrollView: View {   
    
    @EnvironmentObject var dataModel: FuriendModel
    
    @State private var displayAddFriendSheet = false
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color("Background").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    ScrollView {
                        
                        ForEach(self.dataModel.petList) { pet in
                            NavigationLink(destination: FriendDetailView(FriendDataModel: self.dataModel, friendDetail: pet)) {
                                HStack {
                                    Spacer()
                                    FriendListRowItem(
                                        name: pet.name,
                                        breed: pet.breed,
                                        gender: pet.gender,
                                        screenWidth: geo.size.width
                        
                                    )
                                    .animation(.default)
                                    Spacer()
                                }//End of HStack
                            }
                        }// End of ForEach

                    }// End of ScrollView
                    .navigationBarItems(trailing:
                        NavigationLink(destination: AddFriendView(FriendDataModel: self.dataModel)) {
                            HStack {
                                Image(systemName: "plus.app.fill")
                                Text("Furiend")
                                    .fontWeight(.light)
                                    
                            }
                            .foregroundColor(.primary)
                        }
                    )
                    
                    .navigationTitle(Text("Furiends"))
                    .sheet(isPresented: self.$displayAddFriendSheet) {
                        AddFriendView(FriendDataModel: self.dataModel)
                    }
                }
                
            }// End of NavigationView
        }// End of GeometryReader geo1
    }// End of body
    
    func showAddFriend() {
        self.displayAddFriendSheet.toggle()
        
    }// End of showAddFriend
    
}// End of FriendScrollView


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendListView()
//    }
//}
