//
//  afl4App.swift
//  afl4
//
//  Created by SIFT - Telkom DBT Air 6 on 29/05/22.
//

import SwiftUI
import RealmSwift

@main
struct afl4App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.realmConfiguration, Realm.Configuration( /* ... */ ))
        }
    }
}
