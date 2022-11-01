//
//  AhttiaryApp.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

@main
struct AhttiaryApp: App {
    
    @StateObject var persistentStore = PersistentStore.shared
    @StateObject var dateManager: DateManager = DateManager()
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dateManager)
                .environmentObject(mainViewModel)
                .environment(\.managedObjectContext, persistentStore.context)
        }
    }
}
