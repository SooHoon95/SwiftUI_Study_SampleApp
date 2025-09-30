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
    var tokens = tokenize(expr: expression)
    
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
    
    // 케이스 1: 단독 양수 -> (-숫자)
    if let number = Double(expression), number > 0 {
      expression = "(-\(expression))"
      return
    }
    
    // 케이스 2: 단독 음수 -> 양수
    if let number = Double(expression), number < 0 {
      expression = String(-number)
      return
    }
    
    // 케이스 3: 전체가 (-숫자) 형태 -> 숫자
    if expression.hasPrefix("(-") && expression.hasSuffix(")") {
      let startIndex = expression.index(expression.startIndex, offsetBy: 2)
      let endIndex = expression.index(expression.endIndex, offsetBy: -1)
      expression = String(expression[startIndex..<endIndex])
      return
    }
    
    // 케이스 4: 복합 표현식에서 마지막 숫자 토글
    findAndToggleLastNumber()
  }
    
    private func findAndToggleLastNumber() {
      // 마지막 숫자 찾기 (괄호 포함)
         var lastNumberEndIndex = expression.endIndex
         var lastNumberStartIndex = expression.endIndex
         var foundNumber = false
         var isInParentheses = false
         var beforeNumberIndex: String.Index?
         
         // 역순 탐색으로 마지막 숫자 찾기
         for i in expression.indices.reversed() {
           let char = expression[i]
           
           if char == ")" && !foundNumber {
             // 마지막이 )로 끝나는 경우, 괄호 안을 확인
             isInParentheses = true
             continue
           } else if char.isNumber || char == "." {
             if !foundNumber {
               if isInParentheses {
                 lastNumberEndIndex = expression.index(after: expression.firstIndex(of: ")")!)
               } else {
                 lastNumberEndIndex = expression.index(after: i)
               }
               foundNumber = true
             }
             lastNumberStartIndex = i
           } else if char == "-" && foundNumber {
             // 음수 기호 확인
             if i == expression.startIndex {
               lastNumberStartIndex = i
               break
             } else {
               let prevIndex = expression.index(before: i)
               if "+-×÷(".contains(expression[prevIndex]) {
                 lastNumberStartIndex = i
                 break
               } else {
                 beforeNumberIndex = expression.index(after: i)
                 break
               }
             }
           } else if char == "(" && isInParentheses && foundNumber {
             // (-숫자) 패턴 확인
             let nextIndex = expression.index(after: i)
             if nextIndex < expression.endIndex && expression[nextIndex] == "-" {
               if i == expression.startIndex {
                 lastNumberStartIndex = i
                 break
               } else {
                 let prevIndex = expression.index(before: i)
                 if "+-×÷(".contains(expression[prevIndex]) {
                   lastNumberStartIndex = i
                   break
                 } else {
                   beforeNumberIndex = expression.index(after: i)
                   break
                 }
               }
             } else {
               beforeNumberIndex = expression.index(after: i)
               break
             }
           } else if foundNumber {
             beforeNumberIndex = expression.index(after: i)
             break
           }
         }
         
         // 숫자를 찾지 못한 경우 아무것도 하지 않음
         guard foundNumber else { return }
         
         // 찾은 범위에서 숫자 부분 추출
         let beforePart = beforeNumberIndex != nil ? String(expression[..<beforeNumberIndex!]) : ""
         let numberPart = String(expression[lastNumberStartIndex..<lastNumberEndIndex])
         let afterPart = String(expression[lastNumberEndIndex...])
         
         // 괄호 패턴인지 확인
         if numberPart.hasPrefix("(-") && numberPart.hasSuffix(")") {
           // (-숫자) -> 숫자
           let innerNumber = String(numberPart.dropFirst(2).dropLast())
           expression = beforePart + innerNumber + afterPart
         } else if let number = Double(numberPart) {
           if number > 0 {
             // 양수 -> (-숫자)
             expression = beforePart + "(-\(numberPart))" + afterPart
           } else {
             // 음수 -> 양수
             let positiveNumber = formatResult(-number)
             expression = beforePart + positiveNumber + afterPart
           }
         }
    }
    
//    for (i, char) in expression.enumerated().reversed() {
//      /*
//       1. 12 단일 숫자 (-12) 12
//       2. - 단일 숫자
//       3. 표현식 에서 마지막 숫자 -전환
//       4. 표현식에서 마지막 숫자 +로 전환
//       */
//      
//      
//    }
//    
//    
//    for (i, char) in expression.enumerated().reversed() {
//      print("index: ", i, " char: " , char)
//      if char.isNumber || char == "." || char == ")" {
//        if !foundNum {
//          lastNumEndIndex = i
//          foundNum = true
//        }
//        if char != ")" { lastNumber = String(char) + lastNumber }
//        lastNumStartIndex = i
//        
//        if i == 0 {
//          if char.isNumber {
//            lastNumber = "(-\(lastNumber))"
//          }
//          break
//        }
//      } else {
//        if char == "-" || char == "+" {
//          lastNumStartIndex = i
//          lastNumber = String(char) + lastNumber
//          
//          if char == "-" {
//            lastNumber.removeFirst()
//            lastNumber = "" + lastNumber
//            break
//          } else {
//            lastNumber.removeFirst()
//            lastNumber = "-\(lastNumber)"
//            break
//          }
//        } else if char == "(" {
//          lastNumStartIndex = i
//          break
//        }
//      }
//    } // for
//    
//    // lastNumStartIndex와 lastNumEndIndex를 사용하여 마지막 숫자를 replace
//    let startIndex = expression.index(expression.startIndex, offsetBy: lastNumStartIndex)
//    let endIndex = expression.index(expression.startIndex, offsetBy: lastNumEndIndex + 1)
//    let range = startIndex..<endIndex
//    
//    expression.replaceSubrange(range, with: lastNumber)
//    
  
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
