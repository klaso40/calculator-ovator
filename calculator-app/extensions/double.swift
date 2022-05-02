//
//  double.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 29/04/2022.
//

import Foundation


extension Double {
    var canBeInteger: Bool { rounded() == self }
    
    func toString() -> String {
        if self.canBeInteger {
            return String(Int(self))
        } else {
            return String(self)
        }
    }
    
    func toFormattedString() -> String {
        return formatNumber(number: self)
    }
}
