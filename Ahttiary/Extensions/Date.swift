//
//  Date.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/16.
//

import Foundation

extension Date {
    // Date 값을 "XXXX년 XX월 X일" 형태의 String으로 변환
    func convertToDetailedDate() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "yyyy년 MM월 d일"
        
        return dateFormatter.string(from: self)
    }
    
    // Date 값을 "X월 XX일" 형태의 String으로 변환
    func convertToDisplayedDate() -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "M월 d일"
        
        return dateFormatter.string(from: self)
    }
}
