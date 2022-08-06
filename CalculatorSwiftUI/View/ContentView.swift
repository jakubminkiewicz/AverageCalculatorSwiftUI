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
                HStack() {
                    Spacer()
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .scaledToFill()
                        .foregroundColor(.white)
                        .padding([.trailing, .top])
                        .onTapGesture {
                            self.infoPresented = true
                        }
                }
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(env.storedNumbers, id: \.self) { number in
                            Text(String(number))
                                .font(.system(size: 30))
                                .background(Color(.darkGray))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .contextMenu(ContextMenu(menuItems: {
                                    Button("Copy", action: {
                                        UIPasteboard.general.string = env.display
                                    })
                                    Button("Delete", action: {
                                       if let index = env.storedNumbers.firstIndex(of: number) {
                                            env.storedNumbers.remove(at: index)
                                        }
                                    })
                                }))
                        }
                        
                    }
                }
                HStack {
                    Text(env.display)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 80, alignment: .trailing)
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .contextMenu(ContextMenu(menuItems: {
                            Button("Copy", action: {
                                UIPasteboard.general.string = env.display
                            })
                            Button("Delete whole field", action: {
                                env.display = ""
                            })
                        }))
                }.padding(.bottom)
                    .gesture(DragGesture(minimumDistance: 3.0)
                        .onEnded { value in
                            print(value.translation)
                            switch(value.translation.width, value.translation.height) {
                            case (...0, -230...230):
                                print("left swipe")
                                env.display.removeLast()
                            default:
                                break
                            }
                        }
                    )
                
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
        .popover(isPresented: $infoPresented) {
            VStack {
                Spacer()
                Text("Hello! This is how you use the app")
                Text("Hello! This is how you use the app")
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnviroment())
    }
}
