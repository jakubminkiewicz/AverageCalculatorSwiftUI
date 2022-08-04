//
//  GlobalEnviroment.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import Foundation

class GlobalEnviroment: ObservableObject {
    
    @Published var display = ""
    
    var runningNumber = 0.0
    
    var operation: Operation = .none
    
    func receiveInput(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .plus, .minus, .multiply, .divide, .equals, .plusMinus, .percent:
            if calculatorButton == .plus { operation = .plus; self.runningNumber = Double(display)!; display = "" }
            else if calculatorButton == .minus { operation = .minus; self.runningNumber = Double(display)!; display = ""}
            else if calculatorButton == .multiply { operation = .multiply; self.runningNumber = Double(display)!; display = "" }
            else if calculatorButton == .divide { operation = .divide; self.runningNumber = Double(display)!; display = "" }
            else if calculatorButton == .equals {
                preformCalculation(operation: operation)
            }
            break
        case .ac:
            self.display = ""
            self.runningNumber = 0.0
            self.operation = .none
        default:
            if self.display == "0" && calculatorButton.title == "0" {
                break
            }
            else if self.display == "0" && calculatorButton.title != "."{
                self.display = calculatorButton.title
            } else {
                self.display += calculatorButton.title
            }
        }
    }
    
    func preformCalculation(operation: Operation) {
        switch operation {
        case .plus:
            display = Double(self.runningNumber + Double(display)!).stringWithoutZeroFraction
        case .multiply:
            display = Double(self.runningNumber * Double(display)!).stringWithoutZeroFraction
        case .divide:
            display = Double(self.runningNumber / Double(display)!).stringWithoutZeroFraction
        case .minus:
            display = Double(self.runningNumber - Double(display)!).stringWithoutZeroFraction
        case .none:
            break
        default:
            runningNumber = 0.0; display = ""
        }
    }
    
}
