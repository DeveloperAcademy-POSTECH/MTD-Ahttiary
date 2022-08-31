//
//  EndingNoteView.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/06.
//

import SwiftUI

struct EndPageView: View {
    
    @ObservedObject var noteManager: NoteManager
    @EnvironmentObject var mainViewModel: MainViewManager
    @EnvironmentObject var dateManager: DateViewModel
    var draftNote: DraftNote
    
    let imageName: String
    
    var body: some View {
        VStack {
            CustomNavigationBar(
                displayDate: dateManager.selectedDate,
                draftNote: draftNote
            )
                .padding()
            
            Spacer()
            
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
            
            Spacer()
            
            // 페이지 전환 버튼
            HStack(spacing: 20) {
                ChangePageButton("이전") { noteManager.goToPreviousPage() }
                ChangePageButton("종료하기") { mainViewModel.goToMainView() }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.Custom.background.ignoresSafeArea())
    }
}
