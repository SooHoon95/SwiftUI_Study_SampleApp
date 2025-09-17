//
//  CalculatorButton.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import SwiftUI

enum CalculatorButton: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case decimal = "."
    case equal = "="
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "÷"
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    case delete = "del"
    
    var title: String {
        self.rawValue
    }
    
    var backgroundColor: Color {
        switch self {
        case .clear, .delete, .percent:
            return Color(.darkGray)
        case .divide, .multiply, .subtract, .add, .equal:
            return .orange
        default:
            return Color(.systemGray)
        }
    }
}
