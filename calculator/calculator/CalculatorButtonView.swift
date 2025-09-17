//
//  CalculatorButtonView.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    
    
    var body: some View {
        Button(action: {
            print("Circular button tapped!")
        }) {
            Text("Tap Me")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle()) // Makes the background circular
        }
    }
}

#Preview {
    CalculatorButtonView(button: .add)
}
