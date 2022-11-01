//
//  CalendarViewModel.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import Foundation

final class CalendarViewModel {
    let calendar = Calendar.current
    
    // 1개월을 증가시킵니다.
    func getNextMonth(_ date: Date) -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: 1, to: date)
        else { return nil }

        return changedMonth
    }

    // 1개월을 차감합니다.
    func getPreviousMonth(_ date: Date) -> Date? {
        guard let changedMonth = Calendar.current.date(byAdding: .month, value: -1, to: date)
        else { return nil }
        
        return changedMonth
    }

    // 해당월의 일 수를 Int(Optional)형으로 반환합니다.
    func totalDaysInMonth(_ date: Date) -> Int? {
        guard let range = calendar.range(of: .day, in: .month, for: date) else { return nil }
        return range.count
    }
    
    func dayOfMonth(_ date: Date) -> Int? {
        let components = calendar.dateComponents([.day], from: date)
        guard let day = components.day else { return nil }
        return day
    }
    
    func theFirstDayOfMonth(_ date: Date) -> Date? {
        let components = calendar.dateComponents([.year, .month], from: date)
        guard let date = calendar.date(from: components) else { return nil }
        return date
    }
    
    func weekDay(_ date: Date) -> Int? {
        let components = calendar.dateComponents([.weekday], from: date)
        guard let weekday = components.weekday else { return nil }
        return weekday - 1
    }
    
}// CalendarViewModel
