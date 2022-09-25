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
        """
        기다리던 시간이야!
        오늘의 감정기록을 만들어보자.
        """
    ]
    
    // 상황
    static let situationComment: [String] = [
        "좋아, 기록을 시작해보자. 오늘 무슨 일이 있었어?",
        "오늘 무슨 일이 있었는지 말해줄래?",
        "시작해볼까? 먼저 오늘 무슨 일이 있었는지 알려줘!"
    ]
        
    // 정서
    static let feelingComment: [String] = [
        "그런 일이 있었구나. 어떤 기분이 들었니?",
        "그런 일이 있었구나. 그때 어떤 기분이 들었어? 지금은 어때?",
        "음, 그렇구나. 그때 느꼈던 감정을 들려줄래?",
        "그렇구나. 그때 어떤 기분이 들었어?"
    ]
    
    // 이모티콘 선택
    static let selectEmotionComment: String = "네가 느꼈던 것과 가장 가까운 감정을 골라줘."
    
    // 자동적 사고: 1차 이모티콘 선택 이후
    static let automaticThoughtComment: [String] = [
        "어떤 생각이 너에게 앞의 감정을 고르게 했는지 들려줄래?",
        "가끔 나도 그런 기분이 들곤 해. 앞의 감정을 느끼면서 어떤 생각이 들었니?",
        "앞의 감정과 함께 떠오른 생각이 무엇인지 알고 싶어."
    ]
    
    // 인지 왜곡 유형 선택
    static let cognitiveDistortionComment: [String] = [
        "앞에서 기록한 생각에 아래의 패턴이 있는지 확인해볼까?",
        "어쩌면 부정적인 감정이 오해에서 비롯된 것일지도 몰라. 아래 중에 해당하는 것이 있는지 확인해볼까?",
        "너를 힘들게 하는 생각들이, 아래에서 어떤 카테고리에 속하는지 확인해보자!"
    ]
    
    // 합리적 반응
    static let rationalizationComment: [String] = [
        "아하, 그렇구나. 이번에는 앞의 생각을 왜곡하지 않고, 현실에 가깝게 다시 적어볼까?",
        "음, 그렇구나. 앞의 생각을 더 객관적으로 해석하는 방법이 있을까?",
        "알려줘서 고마워! 이번에는 왜곡 없이 오늘 겪었던 상황을 다시 돌아보자!"
    ]
    
    // 긍정경험 묘사
    static let describePositiveExperienceComment: [String] = [
        "즐거웠다니 다행이다! 경험의 어느 부분에서 특히 기쁨을 느꼈는지 알려줄래?"
    ]
    
    // 긍정경험 발전
    static let enhancePositiveExperienceComment: [String] = [
        "이 긍정적인 감정을 유지하고 발전시키기 위해 추가로 무엇을 해볼까?"
    ]
    
    // 결과
    static let resultComment: [String] = [
        "좋아! 오늘의 기록이 끝났어. 훌륭해!",
        "휴, 고생했어! 이걸 반복하면 부정적인 생각으로 빠지는 빈도가 점점 줄어들거야!",
        "음. 오늘의 기록이 무사히 끝났어. 다음에 또 만나자!"
    ]}
