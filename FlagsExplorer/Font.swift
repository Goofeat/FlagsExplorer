//
//  Font.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 20.12.2023.
//

import Foundation
import UIKit

struct Font {
    let familyName = "Lexend"
    var light: UIFont
    var regular: UIFont
    var medium: UIFont
    var semibold: UIFont
    var bold: UIFont
    
    init(size: CGFloat) {
        light = UIFont(name: "\(familyName)-Light", size: size)!
        regular = UIFont(name: "\(familyName)", size: size)!
        medium = UIFont(name: "\(familyName)-Medium", size: size)!
        semibold = UIFont(name: "\(familyName)-SemiBold", size: size)!
        bold = UIFont(name: "\(familyName)-Bold", size: size)!
    }
}
