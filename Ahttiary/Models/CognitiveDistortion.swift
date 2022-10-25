//
//  CognitiveDistortion.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import Foundation

struct CognitiveDistortion {
    static let types: [CognitiveDistortionType] = [
        .polarizedThinking,
        .overgeneralization,
        .personalization,
        .mindReading,
        .mentalFiltering,
        .shouldStatements,
        .emotionalReasoning,
        .labeling
    ]
    
    static func getDiscriptionAndExample(cognitiveDistortionType: CognitiveDistortionType) -> [String: String] {
        switch cognitiveDistortionType {
        case .polarizedThinking:
            return [
                "name": "흑백논리",
                "image": "polarizedThinking",
                "description": "모든 일을 한두 개의 범주로만 받아들이며, 중간 지대는 인정하지 않는 것.",
                "example": "완벽하지 않으면 가치가 없어"
            ]
        case .overgeneralization:
            return [
                "name": "성급한 일반화",
                "image": "overgeneralization",
                "description": "사건을 확대해석하여 섣부른 결론을 내리는 것.",
                "example": "면접에서 떨어졌어. 나는 앞으로도 절대 직업을 구할 수 없을거야."
            ]
        case .personalization:
            return [
                "name": "내 탓이야",
                "image": "personalization",
                "description": "책임이 없거나 통제할 수 없는 사건을 자신의 탓으로 돌리는 것.",
                "example": "강아지가 갑자기 병으로 죽었어. 다 내가 그동안 잘해주지 못해서 생긴 일이야."
            ]
        case .mindReading:
            return [
                "name": "마인드 리딩",
                "image": "mindReading",
                "description": "뚜렷한 근거 없이 타인의 생각이나 의도를 단정짓는 것.",
                "example": "눈이 마주쳤는데도 인사를 하지 않네. 나를 싫어하는게 분명해."
            ]
        case .mentalFiltering:
            return [
                "name": "부정 확성기",
                "image": "mentalFiltering",
                "description": "사건의 긍정적인 측면은 무시하고, 부정적인 측면만을 부각시켜 받아들이는 것.",
                "example": "내 실수가 이번 프로젝트를 완전히 망쳤어."
            ]
        case .shouldStatements:
            return [
                "name": "완벽주의자",
                "image": "shouldStatements",
                "description": "스스로에게 비현실적인 기대를 하거나 무거운 압박을 부여하는 것.",
                "example": "하나도 긴장하지 않고 이 발표를 마쳐야만 해."
            ]
        case .emotionalReasoning:
            return [
                "name": "기분따라",
                "image": "emotionalReasoning",
                "description": "객관적인 근거에 부합하지 않는데도, 개인적인 감정이나 느낌으로 결론을 내리는 것.",
                "example": "A는 나쁜 사람이야. 걔만 보면 질투가 나거든."
            ]
        case .labeling:
            return [
                "name": "낙인",
                "image": "labeling",
                "description": "자신이나 타인에게 강한 고정관념을 가지고, 그에 반하는 정보는 차단하는 것.",
                "example": "이번 대회에서 A가 활약했다고? 꼼수를 쓴게 분명해."
            ]
        }
    }
    
    static let stringToDescription: [String: String] = [
        "polarizedThinking": "흑백논리",
        "overgeneralization": "성급한 일반화",
        "personalization": "내 탓이야",
        "mindReading": "마인드 리딩",
        "mentalFiltering": "부정 확성기",
        "shouldStatements": "완벽주의자",
        "emotionalReasoning": "기분따라",
        "labeling": "낙인"
    ]
    
    static func convertStringToDescription(_ string: String) -> String {
        switch string {
        case "polarizedThinking":
            return "흑백논리"
        case "overgeneralization":
            return "성급한 일반화"
        case "personalization":
            return "내 탓이야"
        case "mindReading":
            return "마인드 리딩"
        case "mentalFiltering":
            return "부정 확성기"
        case "shouldStatements":
            return "완벽주의자"
        case "emotionalReasoning":
            return "기분따라"
        case "labeling":
            return "낙인"
        default:
            return ""
        }
    }
}

enum CognitiveDistortionType: String {
    case polarizedThinking
    case overgeneralization
    case personalization
    case mindReading
    case mentalFiltering
    case shouldStatements
    case emotionalReasoning
    case labeling
}
