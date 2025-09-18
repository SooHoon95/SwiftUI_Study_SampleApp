//
//  CalculatorButtonView.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    let action: () -> Void
    
    var buttonSize: CGFloat {
        UIDevice.current.userInterfaceIdiom == .pad ? 100 : 50
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(button.title)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: buttonSize, height: buttonSize)
                .padding()
                .background(button.backgroundColor)
                .clipShape(Circle()) // Makes the background circular
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}


#Preview {
    CalculatorButtonView(button: .add) {
        print("taptap")
    }
}
