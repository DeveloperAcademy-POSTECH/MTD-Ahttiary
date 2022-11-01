//
//  MonthStruct.swift
//  Ahttiary
//
//  Created by Noah's Ark on 2022/08/04.
//

import Foundation

struct MonthStruct {
    let monthType: MonthType
    let dayInt: Int
    let monthInfo: Int? = Calendar.current.dateComponents([.month], from: Date.now).month
    let yearInfo: Int? = Calendar.current.dateComponents([.year], from: Date.now).year

    // 전달받은 날짜를 String으로 변환합니다.
    func day() -> String {
        return String(dayInt)
    }
    
    // 현재 월을 String (Optional)으로 반환합니다.
    func month() -> String? {
        guard let monthInfo = self.monthInfo else { return nil }
        return String(monthInfo)
    }
    
    // 현재의 년도를 String (Optional)으로 반환합니다.
    func year() -> String? {
        guard let yearInfo = self.yearInfo else { return nil }
        return String(yearInfo)
    }
}

// 선택된 월의 시점을 표시합니다.
enum MonthType {
    case previous
    case current
    case next
}
