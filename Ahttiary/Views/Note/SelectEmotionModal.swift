//
//  SelectEmotionModal.swift
//  아띠어리
//
//  Created by 임성균 on 2022/10/03.
//

import SwiftUI

struct SelectEmotionModal: View {
    
    @Binding var answer: String
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    var body: some View {
        VStack {
            // 감정 선택 그리드
            LazyVGrid(columns: gridItemLayout) {
                ForEach(
                    EmotionStruct.firstEmotionArray,
                    id: \.self
                ) { emotion in
                    EmotionCard(answer: $answer, emotion: emotion)
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color.Custom.background.ignoresSafeArea())
    }
}

