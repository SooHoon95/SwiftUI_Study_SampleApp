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
    
    public func buttonTap(button: CalculatorButton) {
        
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .eight, .seven, .nine:
            
        case .add: break
        case .subtract: break
        case .multiply: break
        case .divide: break
        case .decimal: break
        case .negative: break
        case .equal: break
        case .percent: break
        case .clear: break
        case .delete: break
        }
    }
    
    private func handleNumber(inputNum: String) {
        
        if resultNum != "0" {
            resultNum = "\(resultNum)" + "\(inputNum)"
        } else {
            resultNum = inputNum
        }
    }
}
