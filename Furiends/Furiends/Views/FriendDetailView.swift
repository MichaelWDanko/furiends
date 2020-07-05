//
//  FriendDetailView.swift
//  Furiends
//
//  Created by Michael Danko on 7/3/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendDetailView: View {
    @Environment(\.presentationMode) var isPresented
    @ObservedObject var FriendDataModel: FuriendModel
    
    var friendDetail: Pet
    
    @State private var displayDetailItems = false
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                    FriendDetailItem(textLabel: "Name", textContent: friendDetail.name)
                        .detailItem()
                    FriendDetailItem(textLabel: "Breed", textContent: friendDetail.breed)
                        .detailItem()
                    FriendDetailItem(textLabel: "Gender", textContent: friendDetail.gender.rawValue)
                        .detailItem()
                    FriendDetailItem(textLabel: "Owner", textContent: friendDetail.owner)
                        .detailItem()
                
//                    FriendDetailItem(textLabel: "Energy", symbolContent: Image(systemName: "bolt.fill"), qty: PetEnergy.high.rawValue)
//                        .detailItem()
                    
                    Spacer()
                    
                    Button(action: deleteFriend) {
                        ZStack {
                            Rectangle()
                                .pillShape()
                            Text("Delete Friend")
                                .foregroundColor(Color.red)
                        }
                    }// End of Button
                    .detailItem()
                    .frame(height: 40)
            }// End of VStack
            .padding(.top)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                displayDetailItems = true
            }
            
        }// End of ZStack
        
    }// End of body
    
    func deleteFriend() {
        FriendDataModel.removeFriendWithIdentifier(of: friendDetail.id)
        self.isPresented.wrappedValue.dismiss()
        
    }
    
}// End of FriendDetailView
