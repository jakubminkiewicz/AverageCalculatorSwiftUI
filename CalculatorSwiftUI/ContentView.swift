//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import SwiftUI

enum CalculatorButton: String {
    
    case zero, one, two, three, four, five, six, seven, eight, nine, point
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "÷"
        case .plusMinus: return "±"
        case .percent: return "%"
        case .point: return "."
        default:
            return "AC"
        }
    }
    
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

class GlobalEnviroment: ObservableObject {
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton) {
        switch calculatorButton {
        case .plus, .minus, .multiply, .divide, .equals, .plusMinus, .percent:
            print("Operator tapped!")
        case .ac:
            self.display = ""
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
    
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnviroment
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .point, .equals]
    ]
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Text(env.display)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self){ row in
                    HStack (spacing: 12) {
                        ForEach(row, id: \.self){ button in
                            CalculatorButtonView(button: button)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        
    }
    
    
}

struct CalculatorButtonView: View {
    var button: CalculatorButton
    
    @EnvironmentObject var env: GlobalEnviroment
    
    var body: some View {
        Button {
            print("You pressed \(button.title)")
            self.env.receiveInput(calculatorButton: button)
        } label: {
            Text(button.title)
                .font(.system(size: 32))
                .frame(width: buttonWidth(button: button), height: buttonHeight() )
                .foregroundColor(.white)
                .background(button.backgroundColor)
                .cornerRadius(buttonWidth(button: button)/2)
        }
    }
    
    private func buttonWidth(button: CalculatorButton) -> CGFloat {
        
        if button == .zero {
            return (UIScreen.main.bounds.width - 5 * 12) / 4 * 2 + 12
        }
        
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
    
    private func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnviroment())
    }
}
