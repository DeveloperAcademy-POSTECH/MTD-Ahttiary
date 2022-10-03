//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    @ObservedObject var noteManager: NoteManager
    
    init(note: Note) {
        _noteManager = ObservedObject(wrappedValue: NoteManager(note: note))
    }
    
    var body: some View {
        Group {
            switch noteManager.currentPage {
            case .situation:
                // 상황 기록
                WritePageView(noteManager: noteManager)
            case .selectEmotion:
                // 감정 선택
                SelectEmotionPageView(noteManager: noteManager)
                
                // 긍정적 감정
            case .describePositiveExperience:
                WritePageView(noteManager: noteManager)
                
            case .enhancePositiveExperience:
                WritePageView(noteManager: noteManager)
                
                // 부정적 감정
            case .automaticThought:
                WritePageView(noteManager: noteManager)
                
            case .cognitiveDistortion:
                SelectCognitiveDistortionPageView(noteManager: noteManager)
                
            case .rationalization:
                WritePageView(noteManager: noteManager)
                
                // 마지막 페이지
            case .lastPage:
                LastPageView(noteManager: noteManager)
            }
        }
        .background(Color.Custom.background)
        .onChange(of: noteManager.currentPage) { _ in
            Note.updateNote(using: noteManager.draftNote)
        }
    } // End of body
} // WriteNoteView
