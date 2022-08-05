//
//  CalculatorButtonView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import SwiftUI

struct CalculatorButtonView: View {
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnviroment
    
    var body: some View {
        Button {
            self.env.receiveInput(calculatorButton: button)
        } label: {
            Text(button.rawValue)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: buttonHeight() )
                .foregroundColor(button.foregroundColor)
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth(button: button)/2)
        }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        
        if button == .zero || button == .median || button == .mean {
            // There are 5 spaces between buttons of spacing:12, so we add 12 to final result for UI to allign
            return ((UIScreen.main.bounds.width - 5 * 12) / 4) * 2 + 12
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}
