//
//  DraftNote.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/11.
//

import Foundation

struct DraftNote {
    
    var id: UUID? = nil
    var dateCreated: Date = Date()
    
    var situationComment: String
    var emotionComment: String
    var describePositiveExperienceComment: String
    var enhancePositiveExperienceComment: String
    var automaticThoughtsComment: String
    var cognitiveDistortionComment: String
    var rationalizationComment: String
    var lastPageComment: String
    
    var situationAnswer: String
    var emotionAnswer: String
    var describePositiveExperienceAnswer: String
    var enhancePositiveExperienceAnswer: String
    var automaticThoughtsAnswer: String
    var cognitiveDistortionAnswer: String
    var rationalizationAnswer: String
    
    var displayedDate: String {
        dateCreated.convertToDisplayedDate()
    }
    
    init(note: Note) {
        id = note.id
        dateCreated = note.dateCreated
        
        situationComment = note.situationComment
        emotionComment = note.selectEmotionComment
        describePositiveExperienceComment = note.describePositiveExperienceComment
        enhancePositiveExperienceComment = note.enhancePositiveExperienceComment
        automaticThoughtsComment = note.automaticThoughtsComment
        cognitiveDistortionComment = note.cognitiveDistortionComment
        rationalizationComment = note.rationalizationComment
        lastPageComment = note.lastPageComment
        
        situationAnswer = note.situationAnswer
        emotionAnswer = note.selectEmotionAnswer
        describePositiveExperienceAnswer = note.describePositiveExperienceAnswer
        enhancePositiveExperienceAnswer = note.enhancePositiveExperienceAnswer
        automaticThoughtsAnswer = note.automaticThoughtsAnswer
        cognitiveDistortionAnswer = note.cognitiveDistortionAnswer
        rationalizationAnswer = note.rationalizationAnswer
    }
    
    var associatedNote: Note { Note.object(withID: id!)! }
}
