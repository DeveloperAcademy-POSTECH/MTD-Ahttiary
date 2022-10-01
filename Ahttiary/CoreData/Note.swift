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
    
    var situationComment: String {
        get { situationComment_ ?? "" }
        set { situationComment_ = newValue }
    }
    var selectEmotionComment: String {
        get { selectEmotionComment_ ?? "" }
        set { selectEmotionComment_ = newValue }
    }
    var automaticThoughtsComment: String {
        get { automaticThoughtsComment_ ?? "" }
        set { automaticThoughtsComment_ = newValue }
    }
    var cognitiveDistortionComment: String {
        get { cognitiveDistortionComment_ ?? "" }
        set { cognitiveDistortionComment_ = newValue }
    }
    var rationalizationComment: String {
        get { rationalizationComment_ ?? "" }
        set { rationalizationComment_ = newValue }
    }
    var enhancePositiveExperienceComment: String {
        get { enhancePositiveExperienceComment_ ?? "" }
        set { enhancePositiveExperienceComment_ = newValue }
    }
    var describePositiveExperienceComment: String {
        get { describePositiveExperienceComment_ ?? "" }
        set { describePositiveExperienceComment_ = newValue }
    }
    var lastPageComment: String {
        get { lastPageComment_ ?? "" }
        set { lastPageComment_ = newValue }
    }
    
    var situationAnswer: String {
        get { situationAnswer_ ?? "" }
        set { situationAnswer_ = newValue }
    }
    var selectEmotionAnswer: String {
        get { selectEmotionAnswer_ ?? "" }
        set { selectEmotionAnswer_ = newValue }
    }
    var automaticThoughtsAnswer: String {
        get { automaticThoughtsAnswer_ ?? "" }
        set { automaticThoughtsAnswer_ = newValue }
    }
    var cognitiveDistortionAnswer: String {
        get { cognitiveDistortionAnswer_ ?? "" }
        set { cognitiveDistortionAnswer_ = newValue }
    }
    var rationalizationAnswer: String {
        get { rationalizationAnswer_ ?? "" }
        set { rationalizationAnswer_ = newValue }
    }
    var enhancePositiveExperienceAnswer: String {
        get { enhancePositiveExperienceAnswer_ ?? "" }
        set { enhancePositiveExperienceAnswer_ = newValue }
    }
    var describePositiveExperienceAnswer: String {
        get { describePositiveExperienceAnswer_ ?? "" }
        set { describePositiveExperienceAnswer_ = newValue }
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
        
        newNote.situationComment = Comment.situationComment.randomElement()!
        newNote.selectEmotionComment = Comment.selectEmotionComment
        newNote.describePositiveExperienceComment = Comment.describePositiveExperienceComment.randomElement()!
        newNote.enhancePositiveExperienceComment = Comment.enhancePositiveExperienceComment.randomElement()!
        newNote.automaticThoughtsComment = Comment.automaticThoughtComment.randomElement()!
        newNote.cognitiveDistortionComment = Comment.cognitiveDistortionComment.randomElement()!
        newNote.rationalizationComment = Comment.rationalizationComment.randomElement()!
        newNote.lastPageComment = Comment.lastPageComment.randomElement()!
        
        newNote.situationAnswer = ""
        newNote.selectEmotionAnswer = ""
        newNote.describePositiveExperienceAnswer = ""
        newNote.enhancePositiveExperienceAnswer = ""
        newNote.automaticThoughtsAnswer = ""
        newNote.cognitiveDistortionAnswer = ""
        newNote.rationalizationAnswer = ""
        
        
        PersistentStore.shared.saveContext()
    }
    
    class func getNewNote(_ createdDate: Date = Date()) -> Note {
        let context = PersistentStore.shared.context
        let newNote = Note(context: context)
        
        newNote.id = UUID()
        newNote.dateCreated = createdDate
        
        newNote.situationComment = Comment.situationComment.randomElement()!
        newNote.selectEmotionComment = Comment.selectEmotionComment
        newNote.describePositiveExperienceComment = Comment.describePositiveExperienceComment.randomElement()!
        newNote.enhancePositiveExperienceComment = Comment.enhancePositiveExperienceComment.randomElement()!
        newNote.automaticThoughtsComment = Comment.automaticThoughtComment.randomElement()!
        newNote.cognitiveDistortionComment = Comment.cognitiveDistortionComment.randomElement()!
        newNote.rationalizationComment = Comment.rationalizationComment.randomElement()!
        newNote.lastPageComment = Comment.lastPageComment.randomElement()!
        
        newNote.situationAnswer = ""
        newNote.selectEmotionAnswer = ""
        newNote.describePositiveExperienceAnswer = ""
        newNote.enhancePositiveExperienceAnswer = ""
        newNote.automaticThoughtsAnswer = ""
        newNote.cognitiveDistortionAnswer = ""
        newNote.rationalizationAnswer = ""
        
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
        
        situationComment_ = draftNote.situationComment
        selectEmotionComment_ = draftNote.emotionComment
        describePositiveExperienceComment_ = draftNote.describePositiveExperienceComment
        enhancePositiveExperienceComment_ = draftNote.enhancePositiveExperienceComment
        automaticThoughtsComment_ = draftNote.automaticThoughtsComment
        cognitiveDistortionComment_ = draftNote.cognitiveDistortionComment
        rationalizationComment_ = draftNote.rationalizationComment
        lastPageComment_ = draftNote.lastPageComment
        
        situationAnswer_ = draftNote.situationAnswer
        selectEmotionAnswer_ = draftNote.emotionAnswer
        describePositiveExperienceAnswer_ = draftNote.describePositiveExperienceAnswer
        enhancePositiveExperienceAnswer_ = draftNote.enhancePositiveExperienceAnswer
        automaticThoughtsAnswer_ = draftNote.automaticThoughtsAnswer
        cognitiveDistortionAnswer_ = draftNote.cognitiveDistortionAnswer
        rationalizationAnswer_ = draftNote.rationalizationAnswer
    }
}
