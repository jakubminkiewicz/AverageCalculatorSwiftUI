//
//  InfoView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 11/08/2022.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("MeanDian App")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20.0)
                    Spacer()
                }
                .padding(.leading)
                Spacer()
                VStack (alignment: .leading, spacing: 10){
                    Text("This app allows you to calculate the mean, or median of a given array.")
                    Text("You can use the numpad to input a number, and the add button to add it to the list.")
                    Text("The backspace button will remove the last digit, as well as swiping left on the number field.")
                    Text("You can remove numbers from the list by holding down on the number you wish to remove, and hitting delete.")
                    Text("You can copy the result by holding down on it, and pressing copy.")
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
