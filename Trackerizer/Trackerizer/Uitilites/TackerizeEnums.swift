//
//  TackerizeEnums.swift
//  Trackerizer
//
//  Created by Kishor LD on 17/06/23.
//

import Foundation
import UIKit

enum TrackerizerImageAssests {
    case appleIcon
    case facebookIcon
    case googleIcon
    case logopart1Icon
    case logopart2Icon
    case leadingStyleIcon
    case trailingStyleIcon
    case Frameonboarding
    case checkMark
    
    var image: UIImage {
        switch self {
        case .appleIcon: return UIImage(named: "appleIcon")!
        case .facebookIcon:
            return UIImage(named: "facebookIcon") ?? .add
        case .googleIcon:
            return UIImage(named: "googleIcon") ?? .add
        case .logopart1Icon:
            return UIImage(named: "logoPart1") ?? .add
        case .logopart2Icon:
            return UIImage(named: "logoPart2") ?? .add
        case .leadingStyleIcon:
            return UIImage(named: "leadingImage") ?? .add
        case .trailingStyleIcon:
            return UIImage(named: "trailingImage") ?? .add
        case .Frameonboarding:
            return UIImage(named: "Frameonboarding") ?? .add
        case .checkMark:
            return UIImage(named: "checkMark") ?? .add
        }
    }
}

enum TrackerizerFontAssests {
    case interBold
    case interRegular
    case interSemiBold
    case interMedium
    
    var font: String {
        switch self {
        case .interBold:
            return "Inter-Bold"
        case .interRegular:
            return "Inter-Regular"
        case .interSemiBold:
            return "Inter-SemiBold"
        case .interMedium:
            return "Inter-Medium"
        }
    }
    
}

enum TrackerizerColorAssests {
    case AppBackGround
    case ButonWhite
    case ButtonBlack
    case ButtonBlue
    case Buttongrey
    case ButtonOrange
    case textGrey
    
    var color: UIColor {
        switch self {
            
        case .AppBackGround:
            return UIColor(named: "AppBackGround") ?? .white
        case .ButonWhite:
            return UIColor(named: "ButonWhite") ?? .white
        case .ButtonBlack:
            return UIColor(named: "ButtonBlack") ?? .white
        case .ButtonBlue:
            return UIColor(named: "ButtonBlue") ?? .white
        case .Buttongrey:
            return UIColor(named: "Buttongrey") ?? .white
        case .ButtonOrange:
            return UIColor(named: "ButtonOrange") ?? .white
        case .textGrey:
            return UIColor(named: "textGrey") ?? .white
        }
    }
    
}


