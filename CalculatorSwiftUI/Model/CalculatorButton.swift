//
//  CalculatorButton.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import Foundation
import SwiftUI

enum CalculatorButton: String {
    
    case zero = "0",
         one = "1",
         two = "2",
         three = "3",
         four = "4",
         five = "5",
         six = "6",
         seven = "7",
         eight = "8",
         nine = "9",
         point = ".",
         equals = "=",
         plus = "+",
         minus = "-",
         multiply = "X",
         divide = "/",
         ac = "AC",
         plusMinus = "±",
         percent = "%"
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .point:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
    
}
