//
//  NoteManager.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import Foundation

final class NoteManager: ObservableObject {
    
    @Published var draftNote: DraftNote
    @Published var currentPage: CurrentPage = .situation
    
    init(note: Note) {
        self.draftNote = DraftNote(note: note)
    }
    
    func goToNextPage() {
        switch currentPage {
        case .situation:
            currentPage = .selectEmotion
            
        case .selectEmotion:
            currentPage = isEmotionPositive() ? .describePositiveExperience : .automaticThought
            
            // Negative Case
        case .automaticThought:
            currentPage = .cognitiveDistortion
            
        case .cognitiveDistortion:
            currentPage = .rationalization
            
        case .rationalization:
            currentPage = .lastPage
            
            // Positive Case
        case .describePositiveExperience:
            currentPage = .enhancePositiveExperience
            
        case .enhancePositiveExperience:
            currentPage = .lastPage
            
        case .lastPage:
            break
        }
    }
    
    func goToPreviousPage() {
        switch currentPage {
        case .situation:
            break
            
        case .selectEmotion:
            currentPage = .situation
            
            // Positive Case
        case .describePositiveExperience:
            currentPage = .selectEmotion
            
        case .enhancePositiveExperience:
            currentPage = .describePositiveExperience
            
            // Negative Case
        case .automaticThought:
            currentPage = .selectEmotion
            
        case .cognitiveDistortion:
            currentPage = .automaticThought
            
        case .rationalization:
            currentPage = .cognitiveDistortion
            
            // 마지막 페이지
        case .lastPage:
            currentPage = isEmotionPositive() ? .enhancePositiveExperience : .rationalization
        }
    }
    
    func isEmotionPositive() -> Bool {
        let positiveEmotions = ["satisfied", "happy"]
        
        if positiveEmotions.contains(draftNote.emotionAnswer) {
            return true
        } else {
            return false
        }
    }
    
    func getCurrentPageComment() -> String {
        switch currentPage {
        case .situation:
            return draftNote.situationComment
            
        case .selectEmotion:
            return draftNote.emotionComment
            
        case .describePositiveExperience:
            return draftNote.describePositiveExperienceComment
            
        case .enhancePositiveExperience:
            return draftNote.enhancePositiveExperienceComment
            
        case .automaticThought:
            return draftNote.automaticThoughtsComment
            
        case .cognitiveDistortion:
            return draftNote.cognitiveDistortionComment
            
        case .rationalization:
            return draftNote.rationalizationComment
            
        case .lastPage:
            return draftNote.lastPageComment
        }
    }
    
    func getCurrentPageAnswer() -> String {
        switch currentPage {
        case .situation:
            return draftNote.situationAnswer
            
        case .selectEmotion:
            return draftNote.emotionAnswer
            
        case .describePositiveExperience:
            return draftNote.describePositiveExperienceAnswer
            
        case .enhancePositiveExperience:
            return draftNote.enhancePositiveExperienceAnswer
            
        case .automaticThought:
            return draftNote.automaticThoughtsAnswer
            
        case .cognitiveDistortion:
            return draftNote.cognitiveDistortionAnswer
            
        case .rationalization:
            return draftNote.rationalizationAnswer
            
        default:
            return ""
        }
    }
    
    func getCurrentPageImageName() -> String {
        switch currentPage {
        case .situation:
            return "noteAhtty"
            
        case .selectEmotion:
            return "selectinAhtty"
            
        case .describePositiveExperience, .automaticThought:
            return "questionAhtty"
            
        case .enhancePositiveExperience, .rationalization, .cognitiveDistortion:
            return "helloAhtty"
            
        case .lastPage:
            return "teaAhtty"
        }
    }
    
    func updateDraftNote(answer: String) {
        switch currentPage {
        case .situation:
            draftNote.situationAnswer = answer
            
        case .selectEmotion:
            draftNote.emotionAnswer = answer
            
        case .describePositiveExperience:
            draftNote.describePositiveExperienceAnswer = answer
            
        case .enhancePositiveExperience:
            draftNote.enhancePositiveExperienceAnswer = answer
            
        case .automaticThought:
            draftNote.automaticThoughtsAnswer = answer
            
        case .cognitiveDistortion:
            draftNote.cognitiveDistortionAnswer = answer
            
        case .rationalization:
            draftNote.rationalizationAnswer = answer
            
        case .lastPage:
            break
        }
    }
    
    enum CurrentPage {
        case situation, selectEmotion, describePositiveExperience, enhancePositiveExperience, automaticThought, cognitiveDistortion, rationalization, lastPage
    }
}
