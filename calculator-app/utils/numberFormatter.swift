//
//  numberFormatter.swift
//  calculator-app
//
//  Created by Matúš Klasovitý on 02/05/2022.
//

import Foundation

func formatNumber(number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    formatter.maximumFractionDigits = 10
    formatter.decimalSeparator = "."
    return formatter.string(from: NSNumber(value:  number)) ?? "Math error"
}
