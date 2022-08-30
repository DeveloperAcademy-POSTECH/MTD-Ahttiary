//
//  CustomNavigationBar.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/24.
//

import SwiftUI

struct CustomNavigationBar: View {
    @EnvironmentObject var mainViewModel: MainViewManager
    let displayDate: Date
    
    var body: some View {
        HStack {
            Button {
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
            
//          For Text position arrangement only
            Section(header: Text("")) { Text("") }

        }// HStack
    }// body
}// CustomNavigationBar

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar(displayDate: Date())
            .previewLayout(.sizeThatFits)
    }
}
