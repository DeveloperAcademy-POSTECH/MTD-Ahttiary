//
//  CurrentMonthView.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/03.
//

import SwiftUI

struct CurrentMonthView: View {
    @EnvironmentObject var dateManager: DateViewModel
    var currentYearAndMonth: String {
        let components = Calendar.current.dateComponents([.year, .month], from: dateManager.date)
        let year = components.year
        let month = components.month
        
        return "\(year!)년 \(month!)월"
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                dateManager.fetchPreviousMonth()
            } label: {
                Image(systemName: "chevron.left").foregroundColor(Color.Custom.carrotGreen)
            }
            
            
            Text(currentYearAndMonth)
                .font(.custom(Font.Custom.calendarBold, size: 22))
                .padding(.horizontal, 20)
                .onTapGesture {
                    dateManager.fetchCurrentDate()
                }
            
            Button {
                dateManager.fetchNextMonth()
            } label: {
                Image(systemName: "chevron.right").foregroundColor(Color.Custom.carrotGreen)
            }
            
            
        }
    }// body
    
}// CurrentMonthView

struct CurrentMonthView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentMonthView()
    }
}
