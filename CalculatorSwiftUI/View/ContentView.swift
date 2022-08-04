//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import SwiftUI

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnviroment())
    }
}
