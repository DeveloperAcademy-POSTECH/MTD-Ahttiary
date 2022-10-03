//
//  SelectHappinessLevelPageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct SelectEmotionPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @EnvironmentObject var dateManager: DateViewModel
    @State var answer: String
    @FocusState var isTextFieldsFocused: Bool
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    init(noteManager: NoteManager) {
        self.noteManager = noteManager
        self.answer = noteManager.getCurrentPageAnswer()
    }
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                displayDate: dateManager.selectedDate,
                draftNote: noteManager.draftNote
            )
            .padding()
            
            // 아띠와 말풍선
            HStack(alignment: .center) {
                Text(noteManager.getCurrentPageComment())
                    .frame(
                        height: ScreenSize.questionMessageBoxHeight,
                        alignment: .center
                    )
                    .background(Color.Custom.background)
                    .font(.custom(Font.Custom.comment, size: 20))
                    .padding()
                
                Image(noteManager.getCurrentPageImageName())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: ScreenSize.ahttyWriterWidth)
                    .scaleEffect(CGSize(width: -1.0, height: 1.0))
            }
            
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
            
            // 페이지 전환 버튼
            HStack(spacing: 20) {
                ChangePageButton("이전") {
                    noteManager.updateDraftNote(answer: answer)
                    Note.updateNote(using: noteManager.draftNote)
                    noteManager.goToPreviousPage()
                }
                ChangePageButton("다음") {
                    noteManager.updateDraftNote(answer: answer)
                    Note.updateNote(using: noteManager.draftNote)
                    noteManager.goToNextPage()
                }
                .disabled(answer.isEmpty)
                .opacity(answer.isEmpty ? 0.7 : 1)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color.Custom.background.ignoresSafeArea())
    }
}

struct EmotionCard: View {
    @Binding var answer: String
    let emotion: Emotion
    
    var body: some View {
        Button {
            answer = emotion.rawValue
        } label: {
            RoundedRectangle(cornerRadius: 15)
                .frame(minHeight: 100)
                .foregroundColor(Color.Custom.ahttyWhite)
                .overlay {
                    VStack {
                        Image(emotion.rawValue)
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(1.2)
                            .padding(.top, 20)
                        
                        Text(EmotionStruct().emotionDictionary[emotion]!)
                            .foregroundColor(.black)
                            .font(.custom(Font.Custom.calendarBold, size: 17))
                            .padding(.top, 5)
                            .padding(.bottom, 10)
                    }
                }
        }
        .opacity(answer == emotion.rawValue ? 1 : 0.5)
    }
}
