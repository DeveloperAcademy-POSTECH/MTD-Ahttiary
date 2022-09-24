//
//  Emotion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/23.
//

import Foundation

struct EmotionStruct {
    static let firstEmotionArray: [Emotion] = [
        .angry,
        .sad,
        .irritated,
        .scared,
        .satisfied,
        .happy
    ]
    
    let emotionDictionary: [Emotion : String] = [
        .angry : "화나요",
        .sad : "슬퍼요",
        .irritated : "짜증나요",
        .scared : "두려워요",
        .satisfied : "만족해요",
        .happy : "행복해요"
    ]
}

enum Emotion: String {
    case angry
    case sad
    case irritated
    case scared
    case satisfied
    case happy
}

