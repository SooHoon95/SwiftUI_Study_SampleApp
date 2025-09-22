//
//  ContentView.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
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
        
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()
                VStack {
                    HStack {
                        Spacer()
                        Text(viewModel.expression)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                            .padding()
                            .lineLimit(1) //
                    }
                    
                    LazyVGrid (columns: colums) {
                        ForEach (buttons, id: \.self) { row in
                            ForEach(row, id: \.self) { button in
                                CalculatorButtonView(button: button) {
                                    // button 입력시 활동
                                    viewModel.buttonTap(button)
                                }.padding(5)
                            }
                        }
                    }
                    .padding()
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
