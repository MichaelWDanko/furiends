//
//  ModifiersExtensions.swift
//  Furiends
//
//  Created by Michael Danko on 7/5/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

extension View {
    func pillShape() -> some View {
        self.modifier(PillShape())
    }
 
    func detailItem() -> some View {
        self.modifier(DetailItem())
    }
}



struct PillShape: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .foregroundColor(Color("Primary"))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Primary"), lineWidth: 2)
            )
    }
}


struct DetailItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading)
            .padding(.trailing)
    }
}

