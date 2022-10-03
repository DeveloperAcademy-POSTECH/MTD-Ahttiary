//
//  SelectCognitiveDistortionModal.swift
//  아띠어리
//
//  Created by 임성균 on 2022/10/03.
//

import SwiftUI

struct SelectCognitiveDistortionModal: View {
    
    @ObservedObject var distortionPageManager: DistortionPageManager = DistortionPageManager()
    
    @Binding var answer: String
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
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
                
                // Emotion Selecting Buttons
                ScrollView (showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach(CognitiveDistortion.types, id: \.self) { type in
                            CognitiveDistortionCell(
                                type: type,
                                answer: $answer,
                                distortionPageManager: distortionPageManager
                            )
                        } // ForEach
                    } // LazyVGrid
                } // ScrollView
                
                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Custom.background.ignoresSafeArea())
            
            // 유형 설명 모달
            if distortionPageManager.isShowingDistortionCard {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                CognitiveDistortionCard(distortionPageManager: distortionPageManager)
                    .frame(width: ScreenSize.distortionCardWidth, height: ScreenSize.distortionCardWidth * 1.4, alignment: .center)
            }
            
        } // VStack
    } // body
} // SelectCognitiveDistortionModal
