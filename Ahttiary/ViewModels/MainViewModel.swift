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
    
    func changeCurrentNote(with selectedDate: Date) {
        var selectedNote: FetchedResults<Note>.Element? = nil
        
        selectedNote = noteArray.filter { $0.dateCreated.convertToDetailedDate() == selectedDate.convertToDetailedDate() }.first
        
        if selectedNote != nil {
            DispatchQueue.main.async { self.currentNote = selectedNote }
        } else {
            DispatchQueue.main.async { self.currentNote = nil }
        }
    }
    
    func changeCurrentPage(date: Date) {
        if currentNote == nil {
            createNote(date)
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
    
    func appendNoteToNoteArray(_ note: FetchedResults<Note>.Element?) {
        guard let note = note else { return }
        self.noteArray.append(note)
    }
    
    func updateNoteArray(_ notes: FetchedResults<Note>) {
        noteArray = []
        for note in notes { appendNoteToNoteArray(note) }
    }
    
    func appendAllNotesToNoteArray(_ notes: FetchedResults<Note>) {
        // Append all notes to note array.
        for note in notes { appendNoteToNoteArray(note) }
    }
    
    func createNote(_ createdDate: Date = Date()){
        // 입력받은 날짜의 노트 생성
        let newNote = Note.getNewNote(createdDate)
        // noteArray에 새 노트 추가
        appendNoteToNoteArray(newNote)
        // currentNote를 새 노트로 변경
        currentNote = newNote
    }
} // MainViewManager

enum PageName {
    case main
    case writing
    case reading
}
