//
//  GlobalEnviroment.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import Foundation

class GlobalEnviroment: ObservableObject {
    
    @Published var display = ""
    
    @Published var storedNumbers = [""]
    
    var operation: Operation = .none
    
    func receiveInput(calculatorButton: CalculatorButton) {
        
        print("You pressed \(calculatorButton.rawValue)")
        
        switch calculatorButton {
        case .add:
            if storedNumbers[0] == "" {
                storedNumbers[0] = display
                display = ""
            } else {
            storedNumbers.append(display)
            display = ""
            }
        case .mean:
            if storedNumbers[0] == "" {
                break
            } else {
                if display != "" {
                    storedNumbers.append(display)
                }
                let doubles = storedNumbers.map { Double($0)! }
                print("Here are the doubles: \(doubles)")
                print("Here is the mean \(calculateMean(array: doubles))")
                display = Double(calculateMean(array: doubles)).stringWithoutZeroFraction
            }
        case .ac:
            storedNumbers = [""]
            display = ""
        case .clear:
            display = ""
        case .backspace:
            if display != "" {
                display.removeLast()
            }
        default:
            display += calculatorButton.rawValue
        }
    }
    
    private func calculateMean(array: [Double]) -> Double {
        let sum = array.reduce(0, +)
        
        return Double(sum / Double(array.count))
    }
    

}

//    private func preformCalculation(operation: Operation) {
//        switch operation {
//        case .plus:
//            display = Double(self.runningNumber + Double(display)!).stringWithoutZeroFraction
//        case .multiply:
//            display = Double(self.runningNumber * Double(display)!).stringWithoutZeroFraction
//        case .divide:
//            display = Double(self.runningNumber / Double(display)!).stringWithoutZeroFraction
//        case .minus:
//            display = Double(self.runningNumber - Double(display)!).stringWithoutZeroFraction
//        case .none:
//            break
//        default:
//            runningNumber = 0.0; display = ""
//        }
//    }


//        switch calculatorButton {
//        case .plus, .minus, .multiply, .divide, .equals, .plusMinus, .percent:
//            if calculatorButton == .plus { operation = .plus; self.runningNumber = Double(display)!; display = "" }
//            else if calculatorButton == .minus { operation = .minus; self.runningNumber = Double(display)!; display = ""}
//            else if calculatorButton == .multiply { operation = .multiply; self.runningNumber = Double(display)!; display = "" }
//            else if calculatorButton == .divide { operation = .divide; self.runningNumber = Double(display)!; display = "" }
//            else if calculatorButton == .equals {
//                preformCalculation(operation: operation)
//            }
//            break
//        case .ac:
//            self.display = ""
//            self.runningNumber = 0.0
//            self.operation = .none
//        default:
//            if self.display == "0" && calculatorButton.rawValue == "0" {
//                break
//            }
//            else if self.display == "0" && calculatorButton.rawValue != "."{
//                self.display = calculatorButton.rawValue
//            } else {
//                self.display += calculatorButton.rawValue
//            }
//        }
