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
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Image(systemName: "xmark")
                    .foregroundColor(Color.Custom.carrotGreen)
                    .font(.custom(Font.Custom.calendarBold, size: 18))
                    .onTapGesture {
                        presentation.wrappedValue.dismiss()
                    }
            }
            .padding(.vertical)
            
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

