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
    
    @State var answer: String
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    init(noteManager: NoteManager) {
        self.noteManager = noteManager
        self.answer = noteManager.getCurrentPageAnswer()
    }
    
    var body: some View {
        ZStack {
            VStack {
                CustomNavigationBar(
                    displayDate: dateManager.selectedDate,
                    draftNote: noteManager.draftNote
                )
                .padding()
                
                // 아띠와 말풍선
                HStack(alignment: .center) {
                    Image(noteManager.getCurrentPageImageName())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: ScreenSize.ahttyWriterWidth)
                    
                    Text(noteManager.getCurrentPageComment())
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
                
                // 화면 전환 버튼
                HStack(spacing: 20) {
                    ChangePageButton("이전") {
                        noteManager.updateDraftNote(answer: answer)
                        Note.updateNote(using: noteManager.draftNote)
                        noteManager.goToPreviousPage()
                    }
                    
                    ChangePageButton("선택 완료") {
                        noteManager.updateDraftNote(answer: answer)
                        Note.updateNote(using: noteManager.draftNote)
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
