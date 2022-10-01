//
//  DraftNote.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation

class DraftNote: ObservableObject {
    
    var id: UUID? = nil
    @Published var dateCreated: Date = Date()
    @Published var firstComment: String = ""
    @Published var secondComment: String = ""
    @Published var thirdComment: String = ""
    @Published var fourthComment: String = ""
    @Published var firstAnswer: String = ""
    @Published var secondAnswer: String = ""
    @Published var thirdAnswer: String = ""
    @Published var fourthAnswer: String = ""
    
    var displayedDate: String {
        dateCreated.convertToDisplayedDate()
    }
    
    init(note: Note) {
        id = note.id
        dateCreated = note.dateCreated
        firstComment = note.firstComment
        secondComment = note.secondComment
        thirdComment = note.thirdComment
        fourthComment = note.fourthComment
        firstAnswer = note.firstAnswer
        secondAnswer = note.secondAnswer
        thirdAnswer = note.thirdAnswer
        fourthAnswer = note.fourthAnswer
    }
    
    var associatedNote: Note { Note.object(withID: id!)! }
}
