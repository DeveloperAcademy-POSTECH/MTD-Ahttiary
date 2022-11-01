//
//  ContentView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/07/26.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var dateManager: DateManager
    // fetch notes
    @FetchRequest(fetchRequest: Note.allNotesFR())
    private var notes: FetchedResults<Note>
    
    var body: some View {
        contentView
    }// body
    
    @ViewBuilder private var contentView: some View {
        switch (mainViewModel.pageName) {
        case .main:
            MainView()
                .onAppear {
                    mainViewModel.updateNoteArray(notes)
                    if mainViewModel.currentNote == nil {
                        mainViewModel.changeCurrentNote(with: Date())
                    } else {
                        mainViewModel.changeCurrentNote(with: dateManager.selectedDate)
                    }
                    
                }
        case .writing:
            WriteNoteView(note: mainViewModel.currentNote)
        case .reading:
            ReadNoteView(note: mainViewModel.currentNote!)
        }
    }
}// ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
