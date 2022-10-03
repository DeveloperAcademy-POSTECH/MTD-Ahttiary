//
//  MainViewModel.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/18.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    @Published var pageName: PageName = .main
    @Published var noteArray: [FetchedResults<Note>.Element] = []
    @Published var currentNote: FetchedResults<Note>.Element? = nil
    
    var buttonText: String {
        currentNote == nil ? "감정 기록 쓰기" : "감정 기록 읽기"
    }
    
    func changeCurrentNote(with selectedDate: String) {
        var selectedNote: FetchedResults<Note>.Element? = nil
        
        selectedNote = noteArray.filter { $0.dateCreated.convertToDetailedDate() == selectedDate }.first
        
        if selectedNote != nil {
            DispatchQueue.main.async { self.currentNote = selectedNote }
        } else {
            DispatchQueue.main.async { self.currentNote = nil }
        }
    }
    
    func changeCurrentPage() {
        if currentNote == nil {
            goToWritingView()
        } else {
            goToReadingView()
        }
    }
    
    func goToMainView() {
        withAnimation { pageName = .main }
    }
    
    func goToWritingView() {
        withAnimation { pageName = .writing }
    }
    
    func goToReadingView() {
        guard currentNote != nil else { return }
        withAnimation { pageName = .reading }
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
        
        if currentNote != nil,
           currentNote?.dateCreated.convertToDetailedDate() == createdDate.convertToDetailedDate() {
            selectedNoteView = WriteNoteView(note: currentNote!)
        }
        
        return selectedNoteView
    }
    
} // MainViewManager

enum PageName {
    case main
    case writing
    case reading
}
