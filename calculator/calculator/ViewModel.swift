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
    case .equal: handleEqual()
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
    
    // 케이스 1: 단독 양수 -> (-숫자)
    if let number = Double(expression), number > 0 {
      expression = "(-\(expression))"
      return
    }
    
    // 케이스 2: 단독 음수 -> 양수
    if let number = Double(expression), number < 0 {
      if number.truncatingRemainder(dividingBy: 1) == 0 {
        expression = String(-Int(number))
      } else {
        expression = String(-number)
      }
      return
    }
    
    // 케이스 3: 전체가 (-숫자) 형태 -> 숫자
    if expression.hasPrefix("(-") && expression.hasSuffix(")") {
      let startIndex = expression.index(expression.startIndex, offsetBy: 2)
      let endIndex = expression.index(expression.endIndex, offsetBy: -1)
      expression = String(expression[startIndex..<endIndex])
      return
    }
    
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
  
  private func handleEqual() {
    // evaluate operator
    let clearExpr = evaluateOperator(expr: expression)
    let tokens = tokenize(expr: clearExpr)
    print(tokens)
    
    var targetNum = 0.0
    
    for i in 0..<tokens.count {
      if i == 0 {
        if let firstNum = Double(tokens[i]) {
          targetNum = firstNum
        }
      } else if i > 0 , "+-/*".contains(tokens[i]) {
        if let currentNum = Double(tokens[i+1]) {
          
          let result = operate(inputOperator: tokens[i], targetNum: &targetNum, currentNum: currentNum)
          let remainder = result.truncatingRemainder(dividingBy: 1)
          if remainder == 0 {
            expression = String(Int(result))
          } else {
            expression = String(result)
          }
        }
      }
    }
  }
  
  private func operate(inputOperator: String, targetNum: inout Double, currentNum: Double) -> Double{
    
    switch inputOperator {
    case "+":
      targetNum += currentNum
    case "-":
      targetNum -= currentNum
    case "/":
      targetNum /= currentNum
    case "*":
      targetNum *= currentNum
    default:
      targetNum += currentNum
      break
    }
    return targetNum
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
  
  private func calculator(inputOperator: String) {
    
    switch (inputOperator) {
    case "+": break
    case "-": break
    case "/": break
    case "*": break
    default:
      break
    }
  }
} //
