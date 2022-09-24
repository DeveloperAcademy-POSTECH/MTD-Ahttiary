//
//  WriteNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WriteNoteView: View {
    @ObservedObject var noteManager: NoteManager = NoteManager()
    @StateObject private var draftNote: DraftNote
    
    init(note: Note) {
        _draftNote = StateObject(wrappedValue: DraftNote(note: note))
    }
    
    var body: some View {
        Group {
            switch noteManager.pageNumber {
            case 0:
                // 상황 기록
                WritePageView(
                    noteManager: noteManager,
                    emotion: draftNote.firstEmotion,
                    answer: $draftNote.firstAnswer,
                    imageName: "noteAhtty"
                )
            case 1:
                // 감정 선택
                SelectEmotionPageView(
                    noteManager: noteManager,
                    answer: $draftNote.firstEmotion,
                    imageName: "selectinAhtty"
                )
            case 2:
                // 긍정적 감정의 경우: 긍정적인 요소 확인
                // 부정적 감정의 경우: 감정에 동반된 생각(자동적 사고) 기술
                WritePageView(
                    noteManager: noteManager,
                    emotion: draftNote.firstEmotion,
                    answer: $draftNote.secondAnswer,
                    imageName: "questionAhtty"
                )
            case 3:
                // 긍정적 감정의 경우: 이를 유지하고 발전시키는 방법 탐색
                // 부정적 감정의 경우: 이전 단계에서 기록한 생각을 객관적으로 평가
                WritePageView(
                    noteManager: noteManager,
                    emotion: draftNote.firstEmotion,
                    answer: $draftNote.thirdAnswer,
                    imageName: "helloAhtty"
                )
            case 4:
                // 마지막 페이지(내일도 즐거운 하루 보내자!)
                EndPageView(
                    noteManager: noteManager,
                    imageName: "helloAhtty"
                )
            default:
                EmptyView()
            }
        }
        .background(Color.Custom.background)
        .onChange(of: noteManager.pageNumber) { _ in
                Note.updateNote(using: draftNote)
        }
        .onDisappear {
            Note.updateNote(using: draftNote)
        }
    } // End of body
} // WriteNoteView
