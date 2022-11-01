//
//  Text.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import SwiftUI

extension Text {
    
    // Text의 가로 간격을 최대화 합니다.
    func weekDayViewModifier() -> some View {
        modifier(WeekDayTextViewModifier())
    }
    
}// Text

struct WeekDayTextViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.custom(Font.Custom.calendarBold, size: 20))
            .foregroundColor(Color.Custom.carrotGreen)
    }
    
}// WeekDayTextViewModifier

