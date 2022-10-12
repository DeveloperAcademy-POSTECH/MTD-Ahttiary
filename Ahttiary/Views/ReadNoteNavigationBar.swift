//
//  ReadNoteNavigationBar.swift
//  아띠어리
//
//  Created by 임성균 on 2022/10/03.
//

import SwiftUI

struct ReadNoteNavigationBar: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    let displayDate: Date
    let draftNote: DraftNote
    @Binding var isEditing: Bool
    @State var editingText: String = "수정하기"
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    Note.updateNote(using: draftNote)
                    mainViewModel.goToMainView()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color.Custom.carrotGreen)
                        .font(.headline)
                }
                
                Spacer()
                
                Text(displayDate.convertToDisplayedDate())
                    .font(.custom(Font.Custom.calendarBold, size: 22))
                    .foregroundColor(.black)
                
                Spacer()
                
                // For Text position arrangement only
                Section(header: Text("")) { Text("") }
            } // HStack
            
            HStack {
                Spacer()
                
                Text(editingText)
                    .foregroundColor(Color.Custom.carrotGreen)
                    .font(.custom(Font.Custom.calendarBold, size: 18))
                    .onTapGesture {
                        if isEditing {
                            editingText = "수정완료"
                            isEditing = false
                        } else {
                            editingText = "수정하기"
                            isEditing = true
                        }
                    }
            }
        } // ZStack
    } // body
} // ReadNoteNavigationBar
