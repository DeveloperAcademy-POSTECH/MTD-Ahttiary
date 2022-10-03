//
//  MainView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/02.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @EnvironmentObject var dateManager: DateManager
    
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
                mainViewModel.changeCurrentPage()
            } label: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Custom.carrotGreen)
                    
                    Text(mainViewModel.buttonText)
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
}// MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
