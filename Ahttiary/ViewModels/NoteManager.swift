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
            Comment.feelingComment.randomElement()!,
            
            // 2. 첫 번째 감정 선택
            Comment.selectEmotionComment,
            
            // 3. 자동적 사고
            Comment.automaticThoughtComment.randomElement()!,
            
            // 4. 인지 왜곡 선택
            Comment.cognitiveDistortionComment.randomElement()!,
            
            // 5. 합리적 반응
            Comment.rationalizationComment.randomElement()!,
            
            // 6. 두 번째 감정 선택
            Comment.selectEmotionComment,
            
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
    
    func fetchCurrentPage() -> String {
        return "\(pageNumber + 1)"
    }

}
