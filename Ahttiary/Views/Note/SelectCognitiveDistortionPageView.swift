//
//  SelectCognitiveDistortionPageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct SelectCognitiveDistortionPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @ObservedObject var distortionPageManager: DistortionPageManager = DistortionPageManager()
    @EnvironmentObject var dateManager: DateViewModel
    
    @Binding var answer: String
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    var draftNote: DraftNote
    let imageName: String
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(
                    displayDate: dateManager.selectedDate,
                    draftNote: draftNote
                )
                    .padding()
                
                // 아띠와 말풍선
                HStack(alignment: .center) {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ScreenSize.ahttyWriterWidth)
                    
                    Text(noteManager.randomComments[noteManager.pageNumber])
                        .frame(
                            height: ScreenSize.questionMessageBoxHeight,
                            alignment: .center
                        )
                        .background(Color.Custom.background)
                        .font(.custom(Font.Custom.comment, size: 20))
                        .padding()
                }
                .padding(.horizontal)
                
                // Emotion Selecting Buttons
                ScrollView (showsIndicators: false) {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach(CognitiveDistortion.types, id: \.self) { type in
                            CognitiveDistortionCell(
                                type: type,
                                answer: $answer,
                                distortionPageManager: distortionPageManager
                            )
                        }// ForEach
                    }// LazyVGrid
                }// ScrollView
                .padding(.horizontal)
                                
                Spacer()
                
                Text(noteManager.fetchCurrentPage() + "/7")
                    .font(.custom(Font.Custom.comment, size: 20))
                
                // 화면 전환 버튼
                HStack(spacing: 20) {
                    ChangePageButton("이전") {
                        noteManager.goToPreviousPage()
                    }
                    
                    ChangePageButton("선택 완료") {
                        noteManager.goToNextPage()
                    }
                    .disabled(answer.isEmpty)
                    .opacity(answer.isEmpty ? 0.7 : 1)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.Custom.background.ignoresSafeArea())
            
            
            // 유형 설명 모달
            if distortionPageManager.isShowingDistortionCard {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                CognitiveDistortionCard(distortionPageManager: distortionPageManager)
                    .frame(width: ScreenSize.distortionCardWidth, height: ScreenSize.distortionCardWidth * 1.4, alignment: .center)
            }
            
        }// VStack
    }// body
}// SelectCognitiveDistortionPageView
