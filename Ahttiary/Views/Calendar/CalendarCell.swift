//
//  CalendarCell.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//
// 캘린더에 표시될 각각의 날짜 셀 입니다.

import SwiftUI

struct CalendarCell: View {
    @EnvironmentObject var dateManager: DateManager
    @EnvironmentObject var mainViewModel: MainViewModel
    @FetchRequest(fetchRequest: Note.allNotesFR())
    var notes: FetchedResults<Note>
    let count: Int
    let startingPosition: Int
    let totalDaysInMonth: Int
    let totalDaysInPreviousMonth: Int
    var dayOfThisCell: Int { return fetchMonthStruct().dayInt }
    
    var body: some View {
        if fetchMonthStruct().monthType == .current {
            ZStack {
                Circle()
                    .foregroundColor(dateManager.verifySelectedDay(dayOfThisCell) ? Color.Custom.carrotGreen : .clear)

                if detectNoteData() { Image("carrot").scaleEffect(0.75) }
                
                Text(fetchMonthStruct().day())
                    .font(.custom(Font.Custom.weekDay, size: 14))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(
                        detectNoteData()
                        ? dateManager.verifySelectedDay(dayOfThisCell)
                            ? .white
                            : .black
                        : dateManager.verifySelectedDay(dayOfThisCell)
                            ? .white
                            : dateManager.verifyFutureDate(dayOfThisCell)
                                ? Color.Custom.fontGray
                                : .black
                    )
                    .onTapGesture {
                        withAnimation { dateManager.updateSelectedDate(dayOfThisCell) }
                        if detectNoteData() { linkNoteCoreData() }
                        else { mainViewModel.updateNote(nil)}
                    }
                    .onAppear {
                        if dateManager.verifySelectedDay(dayOfThisCell) {
                            if detectNoteData() { linkNoteCoreData() }
                        }
                    }
                    .disabled(dateManager.verifyFutureDate(dayOfThisCell))
            }
        } else {
            Text("")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }// body
    
    private func fetchMonthStruct() -> MonthStruct {
        if (count <= startingPosition) {
            let day = totalDaysInPreviousMonth + count - startingPosition
            
            return MonthStruct(monthType: .previous, dayInt: day)
        } else if (count - startingPosition > totalDaysInMonth) {
            let day = count - startingPosition - totalDaysInMonth
            
            return MonthStruct(monthType: .next, dayInt: day)
        }
        
        let day = count - startingPosition
        
        return MonthStruct(monthType: .current, dayInt: day)
    }
    
    private func detectNoteData() -> Bool {
        for note in notes {
            guard let dateCreated = note.dateCreated_ else { return false }
            let createdDateOfNote = dateCreated.convertToDetailedDate()
            var dateOfCell: String {
                let components = Calendar.current.dateComponents([.year, .month], from: dateManager.date)
                let year = components.year!
                let month = String(format: "%02d" , components.month!)
                let day = dayOfThisCell
                
                return "\(year)년 \(month)월 \(day)일"
            }
            
            if createdDateOfNote == dateOfCell { return true }
        }
        
        return false
    }
    
    private func linkNoteCoreData() {
        for note in notes { mainViewModel.updateNote(note) }
    }
    
}// CalendarCell

struct CalendarCell_Previews: PreviewProvider {
    static var previews: some View {
        CalendarCell(
            count: 1,
            startingPosition: 1,
            totalDaysInMonth: 1,
            totalDaysInPreviousMonth: 1
        )
    }
}
