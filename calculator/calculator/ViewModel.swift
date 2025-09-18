//
//  ViewModel.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import Foundation

import Combine

class ViewModel: ObservableObject {
    
    @Published var resultNum: String = "0"
    var isNegative: Bool = false
    public func buttonTap(_ button: CalculatorButton) {
        
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .eight, .seven, .nine:
            handleNumber(inputNum: button.title)
        case .add, .subtract, .multiply, .divide, .decimal:
            handleSign(inputSign: button.title)
        case .negative:
            toggleNegative()
        case .equal: break  
        case .percent: break
        case .clear: break
        case .delete: break
        }
    }
    
    private func handleNumber(inputNum: String) {
        
        if resultNum != "0" {
            resultNum += inputNum
        } else {
            resultNum = inputNum
        }
    }
    
    private func handleSign(inputSign: String) {
        resultNum += inputSign
    }
    
    private func toggleNegative() {
        
        if resultNum == "0" {
            return
        }
        if isNegative {
            resultNum.removeLast()
            resultNum.removeFirst(2)
            isNegative.toggle()
        } else {
            resultNum = "(-\(resultNum))"
            isNegative.toggle()
        }
    }
}
