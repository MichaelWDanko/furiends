//
//  FriendListRowItem.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendListRowItem: View {
    
    var name: String
    var breed: String
    var gender: PetGender
    var screenWidth: CGFloat
    
    var genderColor: Color {
        gender == PetGender.male ? Color("MaleColor") : Color("FemaleColor")
    }
    
    var body: some View {
        ZStack {            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color("Primary"))
            
            HStack {
                
                Circle()
                    .foregroundColor(genderColor)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .frame(width: screenWidth / 5, height: screenWidth / 5)
                Spacer()
                VStack {
                    Text(name)
                        .foregroundColor(.primary)
                        .font(.title)
                        .fontWeight(.light)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding(.all, 10)
            }
            
        }// End of ZStack
    }
    
    
}

struct FuriendImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .clipShape(Circle())
            .animation(.easeIn)
    }
}
extension View {
    func furiendImage() -> some View {
        self.modifier(FuriendImage())
    }
}



struct FuriendName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.primary)
            .animation(.easeIn)
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}
extension View {
    func furiendName() -> some View {
        self.modifier(FuriendName())
    }
}

//struct FriendListRow_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
