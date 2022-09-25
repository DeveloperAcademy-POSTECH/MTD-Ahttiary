//
//  Note.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation
import CoreData

extension Note {
    // MARK: Nil coalescing 없이 Attributes를 사용할 수 있게 해주는 코드
    var dateCreated: Date {
        get { dateCreated_ ?? Date() }
        set { dateCreated_ = newValue }
    }
    var firstComment: String {
        get { firstComment_ ?? "" }
        set { firstComment_ = newValue }
    }
    var secondComment: String {
        get { secondComment_ ?? "" }
        set { secondComment_ = newValue }
    }
    var thirdComment: String {
        get { thirdComment_ ?? "" }
        set { thirdComment_ = newValue }
    }
    var fourthComment: String {
        get { fourthComment_ ?? "" }
        set { fourthComment_ = newValue }
    }
    var firstAnswer: String {
        get { firstAnswer_ ?? "" }
        set { firstAnswer_ = newValue }
    }
    var secondAnswer: String {
        get { secondAnswer_ ?? "" }
        set { secondAnswer_ = newValue }
    }
    var thirdAnswer: String {
        get { thirdAnswer_ ?? "" }
        set { thirdAnswer_ = newValue }
    }
    var fourthAnswer: String {
        get { fourthAnswer_ ?? "" }
        set { fourthAnswer_ = newValue }
    }
    
    // MARK: Fetch Request 모음
    class func allNotesFR() -> NSFetchRequest<Note> {
        let request: NSFetchRequest<Note> = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "dateCreated_", ascending: true)]
        return request
    }
    
    // MARK: CRUD 함수들
    class func count() -> Int {
        return count(context: PersistentStore.shared.context)
    }
    
    class func allNotes() -> [Note] {
        return allObjects(context: PersistentStore.shared.context) as! [Note]
    }
    
    class func object(withID id: UUID) -> Note? {
        return object(id: id, context: PersistentStore.shared.context) as Note?
    }
    
    class func addNote() {
        let context = PersistentStore.shared.context
        let newNote = Note(context: context)
        
        newNote.id = UUID()
        newNote.dateCreated = Date()
        newNote.firstComment = ""
        newNote.secondComment = ""
        newNote.thirdComment = ""
        newNote.fourthComment = ""
        newNote.firstAnswer = ""
        newNote.secondAnswer = ""
        newNote.thirdAnswer = ""
        newNote.fourthAnswer = ""
        
        PersistentStore.shared.saveContext()
    }
    
    class func getNewNote(_ createdDate: Date = Date()) -> Note {
        let context = PersistentStore.shared.context
        let newNote = Note(context: context)
        
        newNote.id = UUID()
        newNote.dateCreated = createdDate
        newNote.firstComment = ""
        newNote.secondComment = ""
        newNote.thirdComment = ""
        newNote.fourthComment = ""
        newNote.firstAnswer = ""
        newNote.secondAnswer = ""
        newNote.thirdAnswer = ""
        newNote.fourthAnswer = ""
        
        return newNote
    }
    
    class func delete(_ note: Note) {
        let context = PersistentStore.shared.context
        
        context.delete(note)
        
        PersistentStore.shared.saveContext()
    }
    
    class func updateNote(using draftNote: DraftNote) {
        if let id = draftNote.id,
           let note = Note.object(id: id, context: PersistentStore.shared.context) {
            note.updateValues(from: draftNote)
        } else {
            let newNote = Note.getNewNote()
            newNote.updateValues(from: draftNote)
        }
        
        PersistentStore.shared.saveContext()
    }
    
    private func updateValues(from draftNote: DraftNote) {
        dateCreated_ = draftNote.dateCreated
        firstComment_ = draftNote.firstComment
        secondComment_ = draftNote.secondComment
        thirdComment_ = draftNote.thirdComment
        fourthComment_ = draftNote.fourthComment
        firstAnswer_ = draftNote.firstAnswer
        secondAnswer_ = draftNote.secondAnswer
        thirdAnswer_ = draftNote.thirdAnswer
        fourthAnswer_ = draftNote.fourthAnswer
    }
}
