//
//  MainView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewManager
    @EnvironmentObject var dateManager: DateViewModel
    @State var myNote: FetchedResults<Note>.Element? = nil
    
    var buttonText: String {
        var selectedNote: FetchedResults<Note>.Element? = nil
        
        for note in mainViewModel.noteArray {
            if note.dateCreated.convertToDetailedDate() == dateManager.selectedDate.convertToDetailedDate() {
                selectedNote = note
            }
        }
        
        if selectedNote != nil {
            updateToReadNote(selectedNote!)
            return "감정 기록 읽기"
        }
        else {
            updateToReadNote(nil)
            return "감정 기록 쓰기"
        }
    }
    
    var body: some View {
        VStack {
            CalendarView()
            
            HStack (alignment: .center) {
                Image("helloAhtty")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Spacer()
                
                Text(Comment.mainComment[Int.random(in: 0..<Comment.mainComment.count)])
                    .font(.custom(Font.Custom.comment, size: 20))
            }
            .padding(.horizontal, 36)
            .padding(.bottom, 60)
            
            Button {
                if myNote == nil { mainViewModel.goToWritingView() }
                else { mainViewModel.goToReadingView(myNote) }
            } label: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Custom.carrotGreen)
                    
                    Text(buttonText)
                        .font(.custom(Font.Custom.calendarBold, size: 20))
                        .foregroundColor(.white)
                }
                .frame(minWidth: 250, maxHeight: 50)
            }
            .padding(.horizontal, 70)
            .padding(.bottom, 58)
            
        }// VStack
        .padding(.horizontal, 20)
        .background(Color.Custom.background)
    }// body
    
    private func updateToReadNote(_ note: FetchedResults<Note>.Element?) {
        DispatchQueue.main.async { self.myNote = note }
    }
    
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
