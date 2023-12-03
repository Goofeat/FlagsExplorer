//
//  Country.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import Foundation

struct Country {
    let level: Level
    var code: String
    var name: String
    var flag: String
    var capital: String

    init(level: Level, code: String, name: String, capital: String) {
        self.level = level
        self.code = code.uppercased()
        self.name = name.capitalized
        self.capital = capital.capitalized
        self.flag = ""
        
        for scalar in code.uppercased().unicodeScalars {
            flag.append(String(UnicodeScalar(UInt32(127397) + scalar.value)!))
        }
    }
}
