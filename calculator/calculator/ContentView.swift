//
//  ContentView.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var resultNum = "init Numinit Numinit Numinit Numinit Numinit Numinit Numinit Numinit Numinit Numinit Num"
    let colums: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var buttons: [[CalculatorButton]] = [
        [.delete, .clear, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.negative, .zero, .decimal, .equal]
    ]
    
    var body: some View {
        Spacer()
        VStack {
            HStack {
                Spacer()
                Text("\(resultNum)")
                    .font(.title)
                    .background(.yellow)
                    .padding()
                    .lineLimit(1) //
            }
            
            LazyVGrid (columns: colums) {
                ForEach (buttons, id: \.self) { row in
                    ForEach(row, id: \.self) { button in
                        CalculatorButtonView(button: button) {
                            // button 입력시 활동
                        }
                    }
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
