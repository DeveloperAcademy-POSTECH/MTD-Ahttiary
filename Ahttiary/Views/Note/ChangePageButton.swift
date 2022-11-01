//
//  CustomButton.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/16.
//

import SwiftUI

struct ChangePageButton: View {
    
    var title: String
    var buttonLength: Double
    var action: () -> Void
    
    init(_ title: String, _ buttonLength: ButtonLength = .short, action: @escaping () -> Void) {
        self.title = title
        
        switch buttonLength {
        case .short:
            self.buttonLength = 120
        case .long:
            self.buttonLength = 260
        }
        
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack (alignment: .center) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.Custom.carrotGreen)
                
                Text(title)
                    .font(.custom(Font.Custom.calendarBold, size: 20))
                    .foregroundColor(.white)
            }
        }
        .frame(width: buttonLength, height: 50)
        .padding(.bottom, 12)
    }
}

extension ChangePageButton {
    
    enum ButtonLength {
        case short, long
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        ChangePageButton("테스트") {
            print("테스트")
        }
    }
}
