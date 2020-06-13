//
//  ContentView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

class FriendListModel: ObservableObject {
    
    @Published var petList = [Pet]()
    
    init() {
        petList.append(Pet(name: "Woofer"))
        petList.append(Pet(name: "Flooder"))
        petList.append(Pet(name: "Super"))
        petList.append(Pet(name: "Dooper"))
        petList.append(Pet(name: "Booper"))
    }
}

struct Pet {
    var id = UUID().uuidString
    var name: String
}

struct FriendListView: View {
//    var pets = ["Woofer", "Floofer", "Super", "Dooper", "Booper"]
    
@ObservedObject var dataModel = FriendListModel()
    
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    ForEach(0..<self.dataModel.petList.count) { pet in
                        HStack {
                            Spacer()
                            FriendView(name: self.dataModel.petList[pet].name, screenWidth: geo.size.width)
                            Spacer()
                        }
                    }
                }// End of ScrollView
                .navigationBarTitle(Text("Furiends"))
                
            }// End of NavigationView
        }// End of GeometryReader geo1
    }// End of body
}
struct FriendView: View {
    @State private var isExpanded = false
    var name =  ""
    var breed = "Dawg"
    
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
    }
    func toggleExpand() {
        isExpanded.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
