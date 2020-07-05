//
//  FriendDetailItem.swift
//  Furiends
//
//  Created by Michael Danko on 7/5/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

struct FriendDetailItem: View {
    var textLabel: String
    var textContent: String
    var isContentText = true
    
    var symbolContent: Image?
    var symbolQty: Int?
    
    init(textLabel: String, textContent: String) {
        self.textLabel = textLabel
        self.textContent = textContent
    }
    
    init(textLabel: String, symbolContent: Image, qty: Int) {
        self.textLabel = textLabel
        self.textContent = ""
        self.symbolContent = symbolContent
        self.symbolQty = qty
        self.isContentText = false
    }
    
    var body: some View {

            ZStack {
                Rectangle()
                    .pillShape()
                    .frame(height: 60)
                    
                HStack {

                    Text("\(textLabel):")
                        .font(.title)
                        .fontWeight(.medium)
                    Spacer()
                    
                    if self.isContentText {
                        // Content will be text
                        
                        Text("\(textContent)")
                            .font(.title)
                            .fontWeight(.light)
                            .multilineTextAlignment(.trailing)
                        
                    } else {
                        // Content will be a symbol
//                        HStack {
                            ForEach(0..<self.symbolQty!) {_ in
                                
                                self.symbolContent
                            }
                    }
                    
                }// End of HStack
                .padding(.all, 10)
                
                
            }// End of ZStack
    }
}

struct FriendDetailItem_Previews: PreviewProvider {
    static var previews: some View {
//        FriendDetailItem(textLabel: "Name", textContent: "Jax")
        FriendDetailItem(textLabel: "Energy", symbolContent: Image(systemName: "bolt.fill"), qty: 2)
    }
}

