//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 04/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnviroment
    
    @State var infoPresented = false
    
    let buttons: [[CalculatorButton]] = [
        [.median, .mean],
        [.seven, .eight, .nine, .add],
        [.four, .five, .six, .backspace],
        [.one, .two, .three, .clear],
        [.zero, .point, .ac]
    ]
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack() {
                
                InfoButtonView()
                    .onTapGesture {
                        self.infoPresented = true
                    }
                
                Spacer()
                
                ArrayDisplayView(env: _env)
                DisplayFieldView(env: _env)
                
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
        .popover(isPresented: $infoPresented) { InfoView() }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnviroment())
    }
}
