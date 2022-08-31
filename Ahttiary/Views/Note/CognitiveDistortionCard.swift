//
//  CognitiveDistortionCard.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct CognitiveDistortionCard: View {
    
    @ObservedObject var distortionPageManager: DistortionPageManager
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color.Custom.background)
            .overlay {
                VStack {
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["name"]!)
                        .font(.custom(Font.Custom.calendarBold, size: 22))
                        .padding(.top, 35)
                    
                    Image(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["image"]!)
                        .resizable()
                        .scaledToFit()
                        .padding()
                    
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["description"]!)
                        .font(.custom(Font.Custom.calendarBold, size: 17))
                        .padding()
                    
                    Text("예시) \(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: distortionPageManager.distortionCardType)["example"]!)")
                        .font(.custom(Font.Custom.calendarBold, size: 15))
                        .padding()
                    
                    Spacer()
                    
                    ChangePageButton("확인") {
                        withAnimation { distortionPageManager.isShowingDistortionCard.toggle() }
                    }
                    .padding(.bottom)
                }
            }
    }// body
}// CognitiveDistortionCard
