//
//  ContentView.swift
//  Furiends
//
//  Created by Michael Danko on 6/11/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendListView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct FriendView: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            Image("dog")
                .resizable()
                .clipShape(Circle())
                .scaledToFit()
                .frame(idealWidth: .infinity)
            Text("Name")
                .font(.headline)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
