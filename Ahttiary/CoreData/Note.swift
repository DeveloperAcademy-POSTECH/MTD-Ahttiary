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
    var fifthAnswer: String {
        get { fifthAnswer_ ?? "" }
        set { fifthAnswer_ = newValue }
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
        newNote.firstAnswer = ""
        newNote.secondAnswer = ""
        newNote.thirdAnswer = ""
        newNote.fourthAnswer = ""
        newNote.fifthAnswer = ""
        
        PersistentStore.shared.saveContext()
    }
    
    class func getNewNote() -> Note {
        let context = PersistentStore.shared.context
        let newNote = Note(context: context)
        
        newNote.id = UUID()
        newNote.dateCreated = Date()
        newNote.firstAnswer = ""
        newNote.secondAnswer = ""
        newNote.thirdAnswer = ""
        newNote.fourthAnswer = ""
        newNote.fifthAnswer = ""
        
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
        firstAnswer_ = draftNote.firstAnswer
        secondAnswer_ = draftNote.secondAnswer
        thirdAnswer_ = draftNote.thirdAnswer
        fourthAnswer_ = draftNote.fourthAnswer
        fifthAnswer_ = draftNote.fifthAnswer
    }
}
