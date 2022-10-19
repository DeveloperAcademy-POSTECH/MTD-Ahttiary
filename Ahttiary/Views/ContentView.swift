//
//  ContentView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mainViewManager: MainViewManager
    @EnvironmentObject var dateManager: DateViewModel
    @FetchRequest(fetchRequest: Note.allNotesFR())
    private var notes: FetchedResults<Note>
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    var body: some View {
        contentView
            .fullScreenCover(isPresented: $isFirstLaunching) {
                OnboardingTabView(isFirstLaunching: $isFirstLaunching)
            }
    } // body
    
    @ViewBuilder private var contentView: some View {
        switch (mainViewManager.pageName) {
        case .main:
            MainView()
        case .writing:
            mainViewManager.createNote(dateManager.selectedDate)
        case .reading:
            mainViewManager.readSelectedNote(dateManager.selectedDate)
        }
    }
    
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
