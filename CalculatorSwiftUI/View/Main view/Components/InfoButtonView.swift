//
//  InfoButtonView.swift
//  CalculatorSwiftUI
//
//  Created by Jakub Minkiewicz on 11/08/2022.
//

import SwiftUI

struct InfoButtonView: View {
    var body: some View {
        
        HStack() {
            Spacer()
            Image(systemName: "info.circle")
                .resizable()
                .frame(width: 25, height: 25, alignment: .center)
                .scaledToFill()
                .foregroundColor(.white)
                .padding([.trailing, .top])
        }
        
    }
}
