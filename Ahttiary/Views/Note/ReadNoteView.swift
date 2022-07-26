//
//  ReadNoteView.swift
//  아띠어리
//
//  Created by 임성균 on 2022/10/03.
//

import SwiftUI

struct ReadNoteView: View {
    @ObservedObject var noteManager: NoteManager
    @EnvironmentObject var dateManager: DateManager
    @ObservedObject var readNoteViewModel: ReadNoteViewModel = ReadNoteViewModel()
    @FocusState var isTextFieldsFocused: Bool
    
    init(note: Note) {
        _noteManager = ObservedObject(wrappedValue: NoteManager(note: note))
    }
    
    var body: some View {
        VStack {
            ReadNoteNavigationBar(
                displayDate: dateManager.selectedDate,
                draftNote: noteManager.draftNote,
                isEditing: $readNoteViewModel.isEditing
            )
            .padding()
            
            ScrollView {
                // 상황 기술
                LongCard(title: "상황 기술", content: $noteManager.draftNote.situationAnswer, isTextFieldsFocused: _isTextFieldsFocused, isEditing: readNoteViewModel.isEditing)
                
                // 감정 선택
                ShortCard(type: .emotion, content: noteManager.draftNote.emotionAnswer)
                    .onTapGesture {
                        if readNoteViewModel.isEditing {
                            readNoteViewModel.isShowingSelectEmotionModal = true
                        }
                    }
                    .sheet(isPresented: $readNoteViewModel.isShowingSelectEmotionModal) {
                        SelectEmotionModal(answer: $noteManager.draftNote.emotionAnswer)
                    }
                
                if noteManager.isEmotionPositive() {
                    // MARK: 긍정적 감정을 고른 경우
                    // 경험 서술
                    LongCard(title: "경험 서술", content: $noteManager.draftNote.describePositiveExperienceAnswer, isTextFieldsFocused: _isTextFieldsFocused, isEditing: readNoteViewModel.isEditing)
                    
                    // 경험 강화
                    LongCard(title: "경험 강화", content: $noteManager.draftNote.enhancePositiveExperienceAnswer, isTextFieldsFocused: _isTextFieldsFocused, isEditing: readNoteViewModel.isEditing)
                } else {
                    // MARK: 부정적 감정을 고른 경우
                    // 자동적 사고
                    LongCard(title: "자동적 사고", content: $noteManager.draftNote.automaticThoughtsAnswer, isTextFieldsFocused: _isTextFieldsFocused, isEditing: readNoteViewModel.isEditing)
                    
                    // 인지 왜곡
                    ShortCard(type: .cognitiveDistortion, content: noteManager.draftNote.cognitiveDistortionAnswer)
                        .onTapGesture {
                            if readNoteViewModel.isEditing {
                                readNoteViewModel.isShowingSelectCognitiveDistortionModal = true
                            }
                        }
                        .sheet(isPresented: $readNoteViewModel.isShowingSelectCognitiveDistortionModal) {
                            SelectCognitiveDistortionModal(answer: $noteManager.draftNote.cognitiveDistortionAnswer)
                        }
                    
                    // 합리적 반응
                    LongCard(title: "합리적 반응", content: $noteManager.draftNote.rationalizationAnswer, isTextFieldsFocused: _isTextFieldsFocused, isEditing: readNoteViewModel.isEditing)
                }
            }
        } // VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
        .onAppear {
            UITextView.appearance().backgroundColor = .clear
        }
        .onDisappear {
            Note.updateNote(using: noteManager.draftNote)
        }
    } // body
} // ReadNoteView

struct LongCard: View {
    var title: String
    @Binding var content: String
    @FocusState var isTextFieldsFocused: Bool
    var isEditing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image("normalAhtty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                Text("\(title)")
                    .font(.custom(Font.Custom.calendarBold, size: 17))
                
                Spacer()
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.Custom.ahttyWhite)
                .overlay {
                    TextEditor(text: $content)
                        .frame(height: 150)
                        .font(.custom(Font.Custom.comment, size: 20))
                        .focused($isTextFieldsFocused)
                        .background(Color.Custom.ahttyWhite)
                        .accentColor(Color.Custom.carrotGreen)
                        .padding()
                        .textSelection(.disabled)
                        .disabled(!isEditing)
                }
                .frame(height: 150)
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
    }
}

struct ShortCard: View {
    var type: ShortCardType
    var content: String
    
    var body: some View {
        VStack {
            HStack {
                Image("normalAhtty")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                
                Text("\(type.rawValue)")
                    .font(.custom(Font.Custom.calendarBold, size: 17))
                
                Spacer()
            }
            .padding(.horizontal)
            
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.Custom.ahttyWhite)
                .overlay {
                    VStack {
                        Image(content)
                            .resizable()
                            .scaledToFit()
                            .padding(.top, 20)
                        
                        Text(type == .emotion ? EmotionStruct.convertStringToDescription(content) : CognitiveDistortion.convertStringToDescription(content))
                            .foregroundColor(.black)
                            .font(.custom(Font.Custom.calendarBold, size: 17))
                            .padding(.top, 5)
                            .padding(.bottom, 10)
                    }
                }
                .frame(width: 120, height: 120)
                .padding(.horizontal)
                .padding(.vertical, 5)
        }
    }
    
    enum ShortCardType: String {
        case emotion = "감정"
        case cognitiveDistortion = "인지 왜곡"
    }
}

final class ReadNoteViewModel: ObservableObject {
    @Published var isShowingSelectEmotionModal = false
    @Published var isShowingSelectCognitiveDistortionModal = false
    @Published var isEditing = false
}
