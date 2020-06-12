//
//  ContentView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendListView: View {
    var pets = ["Woofer", "Floofer", "Booper"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.pets, id: \.self) {
                    FriendView(name: $0)
                }
            }
            .navigationBarTitle("Furiends")
            Spacer()
        }
    }
}

struct FriendView: View {
    @State private var isExpanded = false
    
    var name =  ""
    var body: some View {
        Button(action: toggleExpand) {
            HStack {
                VStack {
                    Image("dog")
                        .renderingMode(.original)
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
//                    if self.isExpanded == false {
//                        Text("Name")
//                            .font(.headline)
//                    }
                    
                }
                if self.isExpanded == true {
                    Text(name).font(.title)
                    Text("Breed").font(.headline)
                }
            
            }
        }
        .animation(.default)
    .user
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
