//
//  Double.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
