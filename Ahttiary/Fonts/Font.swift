//
//  Font.swift
//  Ahttiary
//
//  Created by Hyeon-sang Lee on 2022/08/12.
//

import Foundation

struct Font {
    enum Custom {
        static let comment = "나눔손글씨 힘내라는 말보단"
        static let calendarBold = "GangwonEduAll-OTFBold"
        static let calendarLight = "GangwonEduAll-OTFLight"
        static let weekDay = "Poppins-Regular"
    }
}

// 폰트가 적용되지 않는 경우 해당 Text에 아래 내용을 적용한 후
// 출력되는 결과 중 올바른 폰트명을 확인하세요.
// https://kkannsoon2.tistory.com/2
/*
.onAppear {
    for family: String in UIFont.familyNames {
        print(family)
        for names: String in UIFont.fontNames(forFamilyName: family){
            print("=== \(names)")
        }
    }
}
*/
