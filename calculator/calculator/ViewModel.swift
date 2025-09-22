//
//  ViewModel.swift
//  calculator
//
//  Created by 최수훈 on 9/17/25.
//

import Foundation

import Combine

class ViewModel: ObservableObject {
  
  @Published var expression: String = "0"
  var isNegative: Bool = false
  public func buttonTap(_ button: CalculatorButton) {
    
    switch button {
    case .zero, .one, .two, .three, .four, .five, .six, .eight, .seven, .nine:
      handleNumber(inputNum: button.title)
    case .add, .subtract, .multiply, .divide, .decimal:
      handleOperator(inputOperator: button.title)
    case .negative:
      toggleNegative()
    case .equal: break
    case .percent: break
    case .clear: break
    case .delete:
      handleDelete()
    }
  }
  
  private func handleNumber(inputNum: String) {
    if expression != "0" {
      expression += inputNum
    } else {
      expression = inputNum
    }
  }
  
  private func handleOperator(inputOperator: String) {
    if inputOperator == ".", expression == "0" {
      expression += inputOperator
      return
    }
    
    if expression.contains("."), inputOperator == "." {
      return
    }
    
    if expression.last == "+" ||
        expression.last == "-" ||
        expression.last == "÷" ||
        expression.last == "×" {
      expression.removeLast()
      expression += inputOperator
    } else if expression == "0" {
      if inputOperator == "×" || inputOperator == "÷" {
        expression += inputOperator
      } else {
        expression = inputOperator
      }
    } else {
      expression += inputOperator
    }
    
    
  }
  
  private func toggleNegative() {
    if expression.isEmpty || expression == "0" {
      return
    }
    
    if let lastChar = expression.last, "+-×÷".contains(lastChar) {
      return
    }
    
    var lastNumStartIndex = 0
    var lastNumEndIndex = 0
    var foundNum = false
    var lastNumber = ""
    
    for (i, char) in expression.enumerated().reversed() {
      print("index: ", i, " char: " , char)
      if char.isNumber || char == "." {
        if !foundNum {
          lastNumEndIndex = i
          foundNum = true
        }
        lastNumber = String(char) + lastNumber
        lastNumStartIndex = i
        
        if i == 0 {
          if char.isNumber {
            lastNumber = "(-\(lastNumber))"
          }
        }
      } else {
        
        if char == "-" || char == "+" {
          lastNumStartIndex = i
          lastNumber = String(char) + lastNumber
          
          if char == "-" {
            lastNumber.removeFirst()
            lastNumber = "+" + lastNumber
          } else {
            lastNumber.removeFirst()
            lastNumber = "-\(lastNumber)"
          }
          break
        } else {
          lastNumber = "(-\(lastNumber))"
          break
        }
      }
    } // for
    
    // lastNumStartIndex와 lastNumEndIndex를 사용하여 마지막 숫자를 replace
    let startIndex = expression.index(expression.startIndex, offsetBy: lastNumStartIndex)
    let endIndex = expression.index(expression.startIndex, offsetBy: lastNumEndIndex + 1)
    let range = startIndex..<endIndex
    
    expression.replaceSubrange(range, with: lastNumber)
    
  }
  
  private func formatResult(_ result: Double) -> String {
    if result.truncatingRemainder(dividingBy: 1) == 0 {
      return String(format: "%.0f", result)
    } else {
      return String(result)
    }
  }
  
  private func getResult() {
  }
  
  private func handleDelete() {
    if expression != "0" {
      expression.removeLast()
      if expression.isEmpty {
        expression = "0"
      }
    }
  }
  
  private func evaluateOperator(expr: String) -> String{
    var cleanOperator = expr
    
    cleanOperator = cleanOperator.replacingOccurrences(of: "÷", with: "/")
    cleanOperator = cleanOperator.replacingOccurrences(of: "×", with: "*")
    
    return cleanOperator
  }
  
  private func tokenize(expr: String) -> [String] {
    //        var cleanOperatorExpr = evaluateOperator(expr: expr)
    var tokens: [String] = []
    var currentNumber = ""
    
    for char in expr {
      if char.isNumber || char == "." {
        currentNumber.append(char)
      } else {
        if !currentNumber.isEmpty {
          tokens.append(currentNumber)
          currentNumber = ""
        }
        tokens.append(String(char))
      }
    }
    
    if !expr.isEmpty {
      tokens.append(currentNumber)
    }
    
    return tokens
  }
  
} //
