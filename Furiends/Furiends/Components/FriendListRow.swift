//
//  FriendListRow.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendListRow: View {
    @State private var isExpanded = false
    var name =  ""
    var breed = ""
    
    var screenWidth: CGFloat
    var maxWidth: CGFloat {
        isExpanded ? screenWidth / 4 : screenWidth / 2
    }
    var randomPic = Int.random(in: 1...2)
   
    var body: some View {

            Button(action: self.toggleExpand) {
                
                
                
                
                HStack {
                    VStack {
                    Image("dog\(self.randomPic)")
                        .resizable()
                        .renderingMode(.original)
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: maxWidth, height: maxWidth)
                        
                       if self.isExpanded == false {
                        Text(self.name)
                            .font(.title)
                            .foregroundColor(.primary)
                       }
                   }

                   if self.isExpanded == true {
                       VStack {
                        Text(self.name).font(.title)
                        Text(self.breed).font(.headline)
                       }
                       .foregroundColor(.primary)
                   }
               }
            }// End of Button
    }// End of body
    
    func toggleExpand() {
        isExpanded.toggle()
    }
}// End of FriendView


//struct FriendView_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendView()
//    }
//}
