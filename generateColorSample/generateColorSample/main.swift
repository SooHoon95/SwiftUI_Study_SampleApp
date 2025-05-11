////
////  generate_colors.swift
////  UIComponent
////
////  Created by 최수훈 on 2/13/25.
////
//
//import Foundation
//
//// 현재 실행 중인 스크립트 파일의 디렉토리 찾기
//
//let scriptPath = URL(fileURLWithPath: #file.replacingOccurrences(of: "main.swift", with: ""))
//// Directory where the generated file should go
//let jsonFilePath = scriptPath.appendingPathComponent("Colors.xcassets/stylesToken.json").path
//let outputAssetsPath = scriptPath.appendingPathComponent("Colors.xcassets").path
//
//print("📂 현재 경로: \(scriptPath.path)")
//print("📄 JSON 파일 경로: \(jsonFilePath)")
//
//// JSON 파일이 존재하는지 확인
//if !FileManager.default.fileExists(atPath: jsonFilePath) {
//    print("❌ JSON 파일을 찾을 수 없습니다: \(jsonFilePath)")
//    exit(1)
//}
//
//struct ColorDefinition: Codable {
//    let value: String
//}
//
//struct ColorJSON: Codable {
//    let color: [String: ColorDefinition]
//}
//
//func hexStringFromRGBA(rgba: String) -> (hex: String, alpha: Double)? {
//    let pattern = #"rgba\((\d+),(\d+),(\d+),([\d\.]+)\)"#
//    let regex = try? NSRegularExpression(pattern: pattern, options: [])
//    guard let match = regex?.firstMatch(in: rgba, options: [], range: NSRange(location: 0, length: rgba.count)) else {
//        return nil
//    }
//    
//    let nsString = rgba as NSString
//    let r = Int(nsString.substring(with: match.range(at: 1))) ?? 0
//    let g = Int(nsString.substring(with: match.range(at: 2))) ?? 0
//    let b = Int(nsString.substring(with: match.range(at: 3))) ?? 0
//    let a = Double(nsString.substring(with: match.range(at: 4))) ?? 1.0
//    
//    let hex = String(format: "#%02X%02X%02X", r, g, b)
//    return (hex, a)
//}
//
//func generateColorAssets(from jsonPath: String, to assetsPath: String) {
//    guard let data = FileManager.default.contents(atPath: jsonPath) else {
//        print("❌ JSON 파일을 찾을 수 없습니다: \(jsonPath)")
//        return
//    }
//
//    let decoder = JSONDecoder()
//    guard let json = try? decoder.decode(ColorJSON.self, from: data) else {
//        print("❌ JSON 디코딩 실패")
//        return
//    }
//
//    let fileManager = FileManager.default
//    try? fileManager.createDirectory(atPath: assetsPath, withIntermediateDirectories: true, attributes: nil)
//
//    for (colorName, colorDef) in json.color {
//        guard let (hex, alpha) = hexStringFromRGBA(rgba: colorDef.value) else {
//            print("❌ \(colorName) 색상 변환 실패: \(colorDef.value)")
//            continue
//        }
//
//        let colorSetPath = "\(assetsPath)/\(colorName).colorset"
//        try? fileManager.createDirectory(atPath: colorSetPath, withIntermediateDirectories: true, attributes: nil)
//
//        let colorContent = """
//        {
//            "colors": [
//                {
//                    "idiom": "universal",
//                    "color": {
//                        "color-space": "srgb",
//                        "components": {
//                            "red": "\(hex.prefix(2))",
//                            "green": "\(hex.dropFirst(2).prefix(2))",
//                            "blue": "\(hex.dropFirst(4))",
//                            "alpha": "\(alpha)"
//                        }
//                    }
//                }
//            ],
//            "info": {
//                "version": 1,
//                "author": "xcode"
//            }
//        }
//        """
//
//        let colorFilePath = "\(colorSetPath)/Contents.json"
//        try? colorContent.write(toFile: colorFilePath, atomically: true, encoding: .utf8)
//    }
//
//    print("✅ 색상 파일 생성 완료: \(assetsPath)")
//}
//
//// 실행
//generateColorAssets(from: jsonFilePath, to: outputAssetsPath)

//
//  generate_colors.swift
//  UIComponent
//
//  Created by 최수훈 on 2/19/25.
//


import Foundation


// 1️⃣ 실행할 때 JSON 파일 경로를 입력받음

//let scriptPath = URL(fileURLWithPath: FileManager.default.currentDirectoryPath) // 현재 실행 중인 스크립트 파일의 디렉토리
//let jsonFilePath = scriptPath.appendingPathComponent("Assets/stylesToken.json").path
//let outputAssetsPath = scriptPath.appendingPathComponent("Assets/Colors.xcassets").path // Color 생성 위치

let arguments = CommandLine.arguments


// 2️⃣ JSON 경로를 첫 번째 인자로 받음
guard arguments.count > 1 else {
  print("⚠️ 사용법: swift generate_colors.swift <JSON 파일 경로>")
  exit(1)
}

let jsonPath = arguments[1] // 실행 시 입력된 JSON 파일 경로
print("📂 사용된 JSON 파일 경로: \(jsonPath)")

// 3️⃣ JSON 파일이 존재하는지 확인
guard FileManager.default.fileExists(atPath: jsonPath) else {
    print("❌ 오류: JSON 파일을 찾을 수 없습니다! 경로를 확인하세요.")
    exit(1)
}


//print("📂 현재 경로: \(scriptPath.path)")
//print("📄 JSON 파일 경로: \(jsonFilePath)")

// JSON 파일이 존재하는지 확인
//if !FileManager.default.fileExists(atPath: jsonFilePath) {
//  print("❌ JSON 파일을 찾을 수 없습니다: \(jsonFilePath)")
//  exit(1)
//}

struct ColorDefinition: Codable {
  let value: String
}

struct ColorJSON: Codable {
  let color: [String: ColorDefinition]
}

func hexStringFromRGBA(rgba: String) -> (hex: String, alpha: Double)? {
  let pattern = #"rgba\((\d+),(\d+),(\d+),([\d\.]+)\)"#
  let regex = try? NSRegularExpression(pattern: pattern, options: [])
  guard let match = regex?.firstMatch(in: rgba, options: [], range: NSRange(location: 0, length: rgba.count)) else {
    return nil
  }
  
  let nsString = rgba as NSString
  let r = Int(nsString.substring(with: match.range(at: 1))) ?? 0
  let g = Int(nsString.substring(with: match.range(at: 2))) ?? 0
  let b = Int(nsString.substring(with: match.range(at: 3))) ?? 0
  let a = Double(nsString.substring(with: match.range(at: 4))) ?? 1.0
  
  let hex = String(format: "#%02X%02X%02X", r, g, b)
  return (hex, a)
}

func generateColorAssets(from jsonPath: String, to assetsPath: String) {
  guard let data = FileManager.default.contents(atPath: jsonPath) else {
    print("❌ JSON 파일을 찾을 수 없습니다: \(jsonPath)")
    return
  }
  
  let decoder = JSONDecoder()
  guard let json = try? decoder.decode(ColorJSON.self, from: data) else {
    print("❌ JSON 디코딩 실패")
    return
  }
  
  let fileManager = FileManager.default
  try? fileManager.createDirectory(atPath: assetsPath, withIntermediateDirectories: true, attributes: nil)
  
  for (colorName, colorDef) in json.color {
    guard let (hex, alpha) = hexStringFromRGBA(rgba: colorDef.value) else {
      print("❌ \(colorName) 색상 변환 실패: \(colorDef.value)")
      continue
    }
    
    let colorSetPath = "\(assetsPath)/\(colorName).colorset"
    try? fileManager.createDirectory(atPath: colorSetPath, withIntermediateDirectories: true, attributes: nil)
    
    let colorContent = """
        {
            "colors": [
                {
                    "idiom": "universal",
                    "color": {
                        "color-space": "srgb",
                        "components": {
                            "red": "\(hex.prefix(2))",
                            "green": "\(hex.dropFirst(2).prefix(2))",
                            "blue": "\(hex.dropFirst(4))",
                            "alpha": "\(alpha)"
                        }
                    }
                }
            ],
            "info": {
                "version": 1,
                "author": "xcode"
            }
        }
        """
    
    let colorFilePath = "\(colorSetPath)/Contents.json"
    try? colorContent.write(toFile: colorFilePath, atomically: true, encoding: .utf8)
  }
  print("✅ 색상 파일 생성 완료: \(assetsPath)")
}

generateColorAssets(from: jsonPath, to: "/Users/choesuhun/Desktop/Code/GitHub/Mercury/Projects/UIComponent/Resources/Assets/Colors.xcassets")
