//
//  Comment.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/12.
//

import Foundation

struct Comment {
    // 메인
    static let mainComment: [String] = [
        "기다리던 시간이야! 오늘의 감정기록을 만들어보자.",
        "어서와! 오늘의 감정을 기록해볼까?",
        "안녕! 이번 달은 n개의 감정을 기록했구나!"
    ]
    
    // 상황
    static let situationComment: [String] = [
        "좋아, 기록을 시작해보자. 오늘 무슨 일이 있었어?",
        "시작해볼까? 먼저 오늘 무슨 일이 있었는지 알려줘!",
        "좋아 시작해보자. 오늘 기억에 남는 순간이 있니?",
        "오늘은 어떤 일이 있었니?",
        "오늘 어떤 일이 있었는지 말해줄래?"
    ]
    
    // 감정 선택
    static let selectEmotionComment: [String] = [
        "네가 느꼈던 것과 가장 가까운 감정을 골라줘.",
        "그 상황에서 어떤 감정이 떠올랐니? 가장 기억에 남는 감정을 골라줘.",
        "그런 일이 있었구나. 그 상황에서 어떤 감정이 떠올랐니?",
        "그렇구나. 그때 어떤 기분이 들었어?",
        "그렇구나. 그 때 당시 떠오른 감정을 선택해볼까?"
    ]
    
    // 자동적 사고: 1차 이모티콘 선택 이후
    static let automaticThoughtComment: [String] = [
        "어떤 생각이 너에게 앞의 감정을 고르게 했는지 들려줄래?",
        "가끔 나도 그런 기분이 들곤 해. 앞의 감정을 느끼면서 어떤 생각이 들었니?",
        "앞의 감정과 함께 떠오른 생각이 무엇인지 알고 싶어.",
        "부정적인 감정이 떠올랐구나. 이 감정이 떠오르게 된 이유를 생각해볼까?",
        "부정적인 감정이구나. 오늘 있었던 일과 부정적인 감정이 어떻게 연결되었는지 적어볼까?",
        "음 그렇구나. 오늘 있었던 일에서 어떤 부분이 부정적인 감정을 떠올리도록 만들었니?"
    ]
    
    // 인지 왜곡 유형 선택
    static let cognitiveDistortionComment: [String] = [
        "좋아. 방금 적은 생각이 아래의 유형에 해당하지는 않니? 합당하다고 생각하면 건너뛰어도 좋아.",
        "잘하고 있어. 혹시 너의 생각이 아래의 유형에 해당하지는 않는지 확인해볼까? 너의 의견이 맞다면 건너뛰어도 좋아.",
        "거의 다왔어! 방금 적은 생각이 아래 유형에 해당하지는 않니? 충분히 생각한 후에도 너의 의견이 맞다고 느낀다면 이 과정을 건너뛰어도 좋아."
    ]
    
    // 합리적 반응
    static let rationalizationComment: [String] = [
        // 선택한 경우
        "아하, 그렇구나. 이번에는 앞의 생각을 왜곡하지 않고, 현실에 가깝게 다시 적어볼까?",
        "음, 그렇구나. 앞의 생각을 더 객관적으로 해석하는 방법이 있을까?",
        "알려줘서 고마워! 이번에는 왜곡 없이 오늘 겪었던 상황을 다시 돌아보자!",
        "이 유형을 선택했구나. 그러면 새롭게 떠오른 생각을 적어볼까? 이제는 어떻게 생각하니?",
        "그렇구나! 어떤 이유에서 선택했는지 알려줄래? 다음에도 참고할 수 있을 것 같아.",
        
        // 선택하지 않은 경우
        "좋아! 합리적인 감정이라고 생각했구나! 다음 번에도 비슷한 상황이 일어나면 어떻게 행동할 수 있을까?",
        "음! 그럴 만한 이유가 있다고 생각했구나! 그 이유를 알려줄 수 있어? 다음에도 참고할 수 있을 것 같아."
    ]
    
    // 긍정경험 묘사
    static let describePositiveExperienceComment: [String] = [
        "즐거웠다니 다행이다! 경험의 어느 부분에서 특히 기쁨을 느꼈는지 알려줄래?",
        "이 감정이 떠오르게 된 이유를 생각해볼까?",
        "이 감정을 선택하게 된 이유를 알려줄래?",
        "오늘 있었던 일이 어떤 이유에서 이 감정을 떠오르게 했는지 말해줘."
    ]
    
    // 긍정경험 발전
    static let enhancePositiveExperienceComment: [String] = [
        "아하. 그런 이유였군. 다음에도 비슷한 일이 있다면 이 감정이 떠오르겠구나.",
        "음, 그렇구나! 다음에도 이 감정이 떠오른다면 어떤 행동을 할 것 같아?",
        "이 긍정적인 감정을 유지하고 발전시키기 위해 추가로 무엇을 해볼까?"
    ]
    
    // 결과
    static let lastPageComment: [String] = [
        "좋아! 오늘의 기록이 끝났어. 훌륭해!",
        "음. 오늘의 기록이 무사히 끝났어. 다음에 또 만나자!"
    ]}
