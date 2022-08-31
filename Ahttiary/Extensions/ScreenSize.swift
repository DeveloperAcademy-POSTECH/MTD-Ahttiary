//
//  ScreenSize.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import UIKit

enum ScreenSize {
    // Device Screen Size
    static var fullHeight: CGFloat { UIScreen.main.fixedCoordinateSpace.bounds.height }
    static var fullWidth: CGFloat { UIScreen.main.fixedCoordinateSpace.bounds.width }
    
    // WriteNoteView
    static var ahttyWriterWidth: CGFloat { ScreenSize.fullWidth * (1 / 3) }
        
    static var answerMessageBoxHeight: CGFloat { answerMessageBoxWidth }
    static var answerMessageBoxWidth: CGFloat { ScreenSize.fullWidth * (1) }
    
    static var distortionCardWidth: CGFloat { ScreenSize.fullWidth * (4 / 5) }
    
    static var questionMessageBoxHeight: CGFloat { questionMessageBoxWidth * (1 / 2) }
    static var questionMessageBoxWidth: CGFloat { ScreenSize.fullWidth * (2 / 3) }
}

