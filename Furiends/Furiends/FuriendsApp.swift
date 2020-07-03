//
//  FuriendsApp.swift
//  Furiends
//
//  Created by Michael Danko on 6/28/20.
//  Copyright © 2020 Michael Danko. All rights reserved.
//

import SwiftUI

let dataModel = FuriendModel()

@main
struct FuriendsApp: App {
    var body: some Scene {
        WindowGroup {
            FriendScrollView().environmentObject(dataModel)
        }
    }
}
