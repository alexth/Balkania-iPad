//
//  AttributedStringUtils.swift
//  BalkaniaiPad
//
//  Created by Alex Golub on 6/6/17.
//  Copyright © 2017 Alex Golub. All rights reserved.
//

import UIKit

struct AttributedStringUtils {
    func createAttributedString(fullString: String, subString: String) -> NSMutableAttributedString
    {
        let attributedString = NSMutableAttributedString(string: fullString)
        let str = NSString(string: fullString)
        let theRange = str.range(of: subString, options: NSString.CompareOptions.caseInsensitive)
        let yellowColor = ColorUtils().attributedYellowColor()
        attributedString.addAttribute(NSAttributedStringKey.backgroundColor, value: yellowColor, range: theRange)
        return attributedString
    }
}
