//
//  MainViewManager.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/18.
//

import Foundation
import SwiftUI

final class MainViewManager: ObservableObject {
    @Published var pageName: PageName = .main
    @Published var noteArray: [FetchedResults<Note>.Element] = []
    var myNote: FetchedResults<Note>.Element? = nil
    
    func goToMainView() { pageName = .main }

    func goToWritingView() { pageName = .writing }
    
    func goToReadingView(_ note: FetchedResults<Note>.Element?) {
        guard let note = note else { return }
        self.myNote = note
        pageName = .reading
    }
        
    func updateNote(_ note: FetchedResults<Note>.Element?) {
        guard let note = note else { return }
        self.noteArray.append(note)
    }
    
    func createNote(_ createdDate: Date = Date()) -> some View {
        let newNote = Note.getNewNote(createdDate)
        return WriteNoteView(note: newNote)
    }
    
    func readSelectedNote(_ createdDate: Date = Date()) -> some View {
        var selectedNoteView: WriteNoteView? = nil
        
        if
            myNote != nil,
            myNote?.dateCreated.convertToDetailedDate() == createdDate.convertToDetailedDate() {
            selectedNoteView = WriteNoteView(note: myNote!)
        }

        return selectedNoteView
    }
    
}// MainViewManager

enum PageName {
    case main
    case writing
    case reading
}
