//
//  WritePageView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import SwiftUI

struct WritePageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @EnvironmentObject var dateManager: DateViewModel
    @Binding var answer: String
    @FocusState var isTextFieldsFocused: Bool
    
    let imageName: String
    
    var body: some View {
        VStack {
            CustomNavigationBar(displayDate: dateManager.selectedDate)
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
                    .frame(maxWidth: .infinity)
                    .font(.custom(Font.Custom.comment, size: 20))
            }
            .padding(.horizontal)
            .contentShape(Rectangle())
            .onTapGesture { isTextFieldsFocused = false }
            
            // 노트 작성란
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.Custom.ahttyWhite)
                .overlay {
                    TextEditor(text: $answer)
                        .font(.custom(Font.Custom.comment, size: 20))
                        .focused($isTextFieldsFocused)
                        .background(Color.Custom.ahttyWhite)
                        .accentColor(Color.Custom.carrotGreen)
                        .padding()
                        .textSelection(.disabled)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            
                        
            Spacer()
            
            Text(noteManager.fetchCurrentPage() + "/7")
                .font(.custom(Font.Custom.comment, size: 20))
            
            // 페이지 전환 버튼
            HStack(spacing: 20) {
                if noteManager.pageNumber == 0 {
                    ChangePageButton("다음", .long) { noteManager.goToNextPage() }
                        .disabled(answer.isEmpty)
                        .opacity(answer.isEmpty ? 0.7 : 1)
                } else {
                    ChangePageButton("이전") { noteManager.goToPreviousPage() }
                    
                    ChangePageButton("다음") { noteManager.goToNextPage() }
                        .disabled(answer.isEmpty)
                        .opacity(answer.isEmpty ? 0.7 : 1)
                }
                
            }
        } // End of VStack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
        .onAppear { UITextView.appearance().backgroundColor = .clear }
    }
        
}
