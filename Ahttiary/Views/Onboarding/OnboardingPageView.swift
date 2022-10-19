//
//  OnboardingPageView.swift
//  아띠어리
//
//  Created by 이효경 on 2022/10/06.
//

import SwiftUI

struct OnboardingPageView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: ScreenSize.onboardingImageWidth)
                .padding()
            
            Text(title)
                .font(.custom(Font.Custom.calendarBold, size: 24))
                .padding()
                .multilineTextAlignment(.center)
                .lineSpacing(10)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            imageName: "Onboarding_1",
            title: "나의 하루, 나의 감정을\n아띠와 함께 기록해요"
        )
    }
}
