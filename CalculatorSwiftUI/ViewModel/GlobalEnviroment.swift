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
    
    func receiveInput(calculatorButton: CalculatorButton) {
        
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
                let doubles = storedNumbers.map { Double($0)! }
                display = Double(calculateMean(array: doubles)).stringWithoutZeroFraction
            }
            
        case .median:
            if storedNumbers[0] == "" {
                break
            } else {
                let doubles = storedNumbers.map { Double($0)! }
                display = Double(calculateMedian(array: doubles)).stringWithoutZeroFraction
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
            if self.display == "0" && calculatorButton.rawValue == "0" {
                break
            }
            else if self.display == "0" && calculatorButton.rawValue != "."{
                self.display = calculatorButton.rawValue
            } else {
                self.display += calculatorButton.rawValue
            }
            
        }
    }
    
    private func calculateMean(array: [Double]) -> Double {
        // Find the total of all Double in array
        let sum = array.reduce(0, +)
        
        // Returns sum diveded by number of elements in array
        return Double(sum / Double(array.count))
    }
    
    
    private func calculateMedian(array: [Double]) -> Double {
        // Sort array in order
        let sorted = array.sorted()
        //Return average of two middle numbers if array is even
        if sorted.count % 2 == 0 {
            return Double((sorted[(sorted.count / 2)] + sorted[(sorted.count / 2) - 1])) / 2
        } else {
            return Double(sorted[(sorted.count - 1) / 2])
        }
    }
    
    
}
