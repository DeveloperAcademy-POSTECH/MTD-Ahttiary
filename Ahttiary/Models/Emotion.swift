//
//  Emotion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/23.
//

import Foundation

enum Emotion: String {
    case angry
    case sad
    case irritated
    case scared
    case satisfied
    case happy
}

struct EmotionStruct {
    static let firstEmotionArray: [Emotion] = [
        .angry,
        .sad,
        .irritated,
        .scared,
        .satisfied,
        .happy
    ]
    
    static let emotionToDescription: [Emotion : String] = [
        .angry : "화나요",
        .sad : "슬퍼요",
        .irritated : "짜증나요",
        .scared : "두려워요",
        .satisfied : "만족해요",
        .happy : "행복해요"
    ]
    
    static func convertStringToDescription(_ string: String) -> String {
        switch string {
        case "angry":
            return "화나요"
        case "sad":
            return "슬퍼요"
        case "irritated":
            return "짜증나요"
        case "scared":
            return "두려워요"
        case "satisfied":
            return "만족해요"
        case "happy":
            return "행복해요"
        default:
            return ""
        }
    }
}
