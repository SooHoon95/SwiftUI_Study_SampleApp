//
//  Fruits.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 10/20/25.
//

import Foundation

struct FruitsModel: Identifiable {
  let id: String = UUID().uuidString
  let name: String
  let count: Int
}
