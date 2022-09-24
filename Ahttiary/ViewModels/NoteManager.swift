//
//  NoteManager.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import Foundation

final class NoteManager: ObservableObject {
    
    @Published var pageNumber: Int = 0
    let lastPageNumber: Int = 7
    
    var randomComments: [String]
    
    init() {
        randomComments = [
            // 0. 상황 기술
            Comment.situationComment.randomElement()!,
            
            // 1. 정서 기술
            Comment.sentimentComment.randomElement()!,
            
            // 2. 첫 번째 감정 선택
            Comment.selectEmoticonComment,
            
            // 3. 자동적 사고
            Comment.unconsciousnessComment.randomElement()!,
            
            // 4. 인지 왜곡 선택
            Comment.cognitiveDistortionComment.randomElement()!,
            
            // 5. 합리적 반응
            Comment.rationalComment.randomElement()!,
            
            // 6. 두 번째 감정 선택
            Comment.selectEmoticonComment,
            
            // 7. 결과
            Comment.resultComment.randomElement()!
        ]
    }
    
    func goToNextPage() {
        if pageNumber != lastPageNumber {
            pageNumber += 1
        }
    }
    
    func goToPreviousPage() {
        if pageNumber != 0 {
            pageNumber += -1
        }
    }
    
    func goToFirstPage() {
        pageNumber = 0
    }
    
    func goToLastPage() {
        pageNumber = lastPageNumber
    }
    
    func getCurrentPageRandomComment(emotion: String) -> String {
        let emotions = ["angry", "sad", "irritated", "scared"]
        
        switch pageNumber {
        case 0:
            return Comment.situationComment.randomElement()!
        case 1:
            return Comment.selectEmoticonComment
        case 2:
            if emotions.contains(emotion) {
                // 부정적 감정 선택 시: 자동적 사고
                return Comment.unconsciousnessComment.randomElement()!
            } else {
                // 긍정적 감정 선택 시: 긍정적 경험 서술
                return Comment.describePositiveExperienceComment.randomElement()!
            }
        case 3:
            if emotions.contains(emotion) {
                // 부정적 감정 선택 시: 합리적 반응
                return Comment.rationalComment.randomElement()!
            } else {
                // 긍정적 감정 선택 시: 긍정적 경험 발전
                return Comment.enhancePositiveExperienceComment.randomElement()!
            }
        default:
            return ""
        }
    }
}
