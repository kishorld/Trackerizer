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
    case oneDriveLogo
    case spotifyLogo
    case yTPremiumLogo
    case date
    case plus
    case home
    case calender
    case spending
    case cards
    case setting
    case Group
    case add
    case auto
    case entertainment
    case security
    case chip
    case masterCardLogo
    case netfilx
    case Ellipse1
    case Ellipse2
    
    
    var image: UIImage {
        switch self {
        case .appleIcon: return UIImage(named: "appleIcon") ?? .add
        case .facebookIcon:
            return UIImage(named: "facebookIcon") ?? .add
        case .googleIcon:
            return UIImage(named: "googleIcon") ?? .add
        case .logopart1Icon:
            return UIImage(named: "logoPart1") ?? .add
        case .logopart2Icon:
            return UIImage(named: "logoPart2") ?? .add
        case .leadingStyleIcon:
            return UIImage(named: "lleadingImage") ?? .add
        case .trailingStyleIcon:
            return UIImage(named: "trailing") ?? .add
        case .Frameonboarding:
            return UIImage(named: "Frameonboarding") ?? .add
        case .checkMark:
            return UIImage(named: "checkMark") ?? .add
        case .oneDriveLogo:
            return UIImage(named: "OneDriveLogo") ?? .add
        case .spotifyLogo:
            return UIImage(named: "SpotifyLogo") ?? .add
        case .yTPremiumLogo:
            return UIImage(named: "YTPremiumLogo") ?? .add
        case .date:
            return UIImage(named: "Date") ?? .add
        case .plus:
            return UIImage(named: "plus") ?? .add
        case .home:
            return UIImage(named: "home") ?? .add
        case .calender:
            return UIImage(named: "Calendar") ?? .add
        case .spending:
            return UIImage(named: "budgets") ?? .add
        case .cards:
            return UIImage(named: "creditCards") ?? .add
        case .setting:
            return UIImage(named: "Settings") ?? .add
        case .Group:
            return UIImage(named: "Group") ?? .add
        case .add:
            return UIImage(named: "Add") ?? .add
        case .auto:
            return UIImage(named: "Auto") ?? .add
        case .entertainment:
            return UIImage(named: "Entertainment") ?? .add
        case .security:
            return UIImage(named: "Security") ?? .add
        case .chip:
            return UIImage(named: "Chip") ?? .add
        case .masterCardLogo:
            return UIImage(named: "MasterCardLogo") ?? .add
        case .netfilx:
            return UIImage(named: "netfilx") ?? .add
        case .Ellipse1:
            guard let image = UIImage(named: "Ellipse1") else {
                    fatalError()
                }
                return image
        case .Ellipse2:
            return UIImage(named: "Ellipse2") ?? .add
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
    case GreyScale
    case dottedGreyScale60
    case GreyScale40
    case lightBlue
    case lightPurple
    case greyScale30
    case greyScale50
    case cardColor
    
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
        case .GreyScale:
            return UIColor(named: "GreyScale") ?? .white
        case .dottedGreyScale60:
            return UIColor(named: "dottedGreyScale60") ?? .white
        case .GreyScale40:
            return UIColor(named: "GreyScale40") ?? .white
            
        case .lightBlue:
            return UIColor(named: "lightBlue") ?? .white
        case .lightPurple:
            return UIColor(named: "lightPurple") ?? .white
        case .greyScale30:
            return UIColor(named: "GreyScale30") ?? .white
        case .greyScale50:
            return UIColor(named: "GreyScale50") ?? .white
        case .cardColor:
            return UIColor(named: "cardColor") ?? .white
        }
    }
    
}


