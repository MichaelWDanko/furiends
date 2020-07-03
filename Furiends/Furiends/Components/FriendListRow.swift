//
//  FriendListRow.swift
//  Furiends
//
//  Created by Michael Danko on 6/13/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendListRow: View {
    
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
                        .foregroundColor(Color("PrimaryFont"))
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .padding(.all, 10)
            }
            
        }// End of ZStack
    }
    
    
}





//struct FriendListRow: View {
//    @State private var isExpanded = false
//    @Namespace private var animation
//    var name =  ""
//    var breed = ""
//
//    var screenWidth: CGFloat
//    var maxWidth: CGFloat {
//        isExpanded ? screenWidth / 4 : screenWidth / 2
//    }
//    var randomPic = Int.random(in: 1...2)
//
//    var body: some View {
//
//        Group {
//            if self.isExpanded {
//                //Row is expanded. Need to show details beside picture.
//
//                HStack {
////                    Spacer()
//                    Image("dog\(self.randomPic)")
//                        .resizable()
//                        .furiendImage()
//                        .frame(width: maxWidth, height: maxWidth)
//                        .matchedGeometryEffect(id: "FuriendImage", in: self.animation)
////                    Spacer()
//                    VStack {
//                        Text(self.name).font(.title)
//                            .furiendName()
//                        Text(self.breed).font(.headline)
//                            .animation(.easeIn)
//                    }
//                    .foregroundColor(.primary)
//                    Spacer()
//
//                }// End of HStack
////                .animation(.easeOut(duration: 1.0))
//                .matchedGeometryEffect(id: "DetailsContainer", in: self.animation)
//                .onTapGesture {
//                    self.isExpanded.toggle()
//                }
//
//            } else {
//                //Row is not expanded. Need to show name below picture.
//
//                VStack {
//
//                    Image("dog\(self.randomPic)")
//                        .resizable()
//                        .furiendImage()
//                        .frame(width: maxWidth, height: maxWidth)
//                        .matchedGeometryEffect(id: "FuriendImage", in: self.animation)
//
//                    Text(self.name)
//                        .furiendName()
//
//               }//End of VStack
////                .animation(.easeOut(duration: 1.0))
//                .matchedGeometryEffect(id: "DetailsContainer", in: self.animation)
//                .onTapGesture {
//                    self.isExpanded.toggle()
//
//                }
//
//            }// End of If/Else
//        }
//    }// End of body
//
//}// End of FriendView

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
