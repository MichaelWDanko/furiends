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
    
    var body: some View {
        VStack {
            Text(friendDetail.id)
            Text(friendDetail.name)
            Text(friendDetail.breed)
            Text(friendDetail.gender.rawValue)
            Text(friendDetail.owner)
            Spacer()
            Button(action: deleteFriend) {
                Text("Delete")
            }
            .foregroundColor(Color.red)
            Spacer()
        }
    }// End of body
    
    func deleteFriend() {
        print("Should delete something")
        FriendDataModel.removeFriendWithIdentifier(of: friendDetail.id)
        self.isPresented.wrappedValue.dismiss()
        
    }
    
}// End of FriendDetailView

//
//struct FriendDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendDetailView()
//    }
//}
