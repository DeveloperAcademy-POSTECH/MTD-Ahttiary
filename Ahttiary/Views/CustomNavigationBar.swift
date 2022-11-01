//
//  CustomNavigationBar.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/24.
//

import SwiftUI

struct CustomNavigationBar: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State var isPresented: Bool = false
    let displayDate: Date
    let draftNote: DraftNote
    
    var body: some View {
        HStack {
            Button {
                self.isPresented = true
            } label: {
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.Custom.carrotGreen)
                    .font(.headline)
            }
            .alert("알림", isPresented: $isPresented) {
                Button("취소") { }
                Button("돌아가기") {
                    Note.updateNote(using: draftNote)
                    mainViewModel.goToMainView()
                }
            } message: { Text("작성 중인 내용을 저장하고 메인 화면으로 돌아갈까요?") }

            Spacer()
            
            Text(displayDate.convertToDisplayedDate())
                .font(.custom(Font.Custom.calendarBold, size: 22))
                .foregroundColor(.black)
            
            Spacer()
            
//          For Text position arrangement only
            Section(header: Text("")) { Text("") }

        }// HStack
    }// body
}// CustomNavigationBar
