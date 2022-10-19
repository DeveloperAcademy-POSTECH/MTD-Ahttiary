//
//  OnboardingTabView.swift
//  아띠어리
//
//  Created by 이효경 on 2022/10/06.
//

import SwiftUI

struct OnboardingTabView: View {
    @Binding var isFirstLaunching: Bool
    @State var tagNumber: Int = 0
    
    init(isFirstLaunching: Binding<Bool>) {
        _isFirstLaunching = isFirstLaunching
        
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color.Custom.carrotGreen)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("건너뛰기")
                    .onTapGesture {
                        isFirstLaunching = false
                    }
                    .font(.custom(Font.Custom.calendarBold, size: 20))
                    .padding(.top, 30)
                    .padding(.trailing, 30)
                    .foregroundColor(Color.Custom.carrotGreen)
                    .opacity(tagNumber == 2 ? 0 : 1)
            }
            
            TabView(selection: $tagNumber) {
                // 페이지 1
                OnboardingPageView(
                    imageName: "Onboarding_1",
                    title: "나의 하루, 나의 감정을\n아띠와 함께 기록해요"
                )
                .tag(0)
                
                // 페이지 2
                OnboardingPageView(
                    imageName: "Onboarding_2",
                    title: "나의 감정을 알아가며\n행복해지는 방법을 배워요"
                )
                .tag(1)
                
                // 페이지 3
                OnboardingPageView(
                    imageName: "Onboarding_3",
                    title: "나를 더 잘 아는 것,\n스스로의 행복을 찾는 첫 걸음입니다"
                )
                .tag(2)
                
            }
            .tabViewStyle(PageTabViewStyle())
            Button {
                isFirstLaunching = false
            } label: {
                ZStack (alignment: .center) {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.Custom.carrotGreen)
                        .frame(width: 250, height: 50)
                    
                    Text("시작하기")
                        .font(.custom(Font.Custom.calendarBold, size: 20))
                        .foregroundColor(.white)
                }
            }
            .frame(height: 82)
            .opacity(tagNumber == 2 ? 1 : 0)
        }
        .background(Color.Custom.cardBackground)
    }
}
