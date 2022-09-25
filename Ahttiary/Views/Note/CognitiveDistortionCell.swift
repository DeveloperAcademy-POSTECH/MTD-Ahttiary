//
//  CognitiveDistortionCell.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/24.
//

import SwiftUI

struct CognitiveDistortionCell: View {
    var type: CognitiveDistortionType
    @Binding var answer: String
    @ObservedObject var distortionPageManager: DistortionPageManager
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(type.rawValue == answer ? Color.Custom.carrotGreen : Color.clear, lineWidth: 6)
            .frame(maxWidth: .infinity, minHeight: 250, maxHeight: .infinity)
            .background(Color.Custom.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                VStack {
                    HStack {
                        Spacer()
                        
                        Button {
                            withAnimation {
                                distortionPageManager.distortionCardType = type
                                distortionPageManager.isShowingDistortionCard.toggle()
                            }
                        } label: {
                            Image(systemName: "info.circle")
                                .foregroundColor(Color.Custom.carrotGreen)
                                .font(.system(size: 17))
                        }
                    }
                    .padding(.trailing)
                    .padding(.top)
                    
                    Image(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: type)["image"]!)
                        .resizable()
                        .padding(.horizontal)
                    
                    Text(CognitiveDistortion.getDiscriptionAndExample(cognitiveDistortionType: type)["name"]!)
                        .font(.custom(Font.Custom.calendarBold, size: 17))
                        .padding(.vertical)
                }
            }
            .onTapGesture { withAnimation { answer = type.rawValue } }
        
    }// body
}// CognitiveDistortionCell
