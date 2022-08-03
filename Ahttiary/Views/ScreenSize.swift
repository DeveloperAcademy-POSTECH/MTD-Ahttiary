//
//  ScreenSize.swift
//  Ahttiary
//
//  Created by 임성균 on 2022/08/03.
//

import UIKit

enum ScreenSize {
    // Device Screen Size
    static var fullWidth: CGFloat { UIScreen.main.fixedCoordinateSpace.bounds.width }
    static var fullHeight: CGFloat { UIScreen.main.fixedCoordinateSpace.bounds.height }
    
    // WritingNoteView
    static var ahttyWriterWidth: CGFloat { ScreenSize.fullWidth * (1 / 3) }
    
    static var questionMessageBoxWidth: CGFloat { ScreenSize.fullWidth * (2 / 3) }
    static var questionMessageBoxHeight: CGFloat { questionMessageBoxWidth * (1 / 2) }
    
    static var answerMessageBoxWidth: CGFloat { ScreenSize.fullWidth * (1) }
    static var answerMessageBoxHeight: CGFloat { answerMessageBoxWidth }
    
}
