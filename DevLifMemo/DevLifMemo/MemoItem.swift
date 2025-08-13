//
//  MemoItem.swift
//  DevLifMemo
//
//  Created by 최수훈 on 5/11/25.
//
import Foundation

struct MemoItem: Identifiable, Hashable {
  var id = UUID()
  var number: Int
  var title: String
  var description: String
  var date = Date().timeIntervalSince1970
}
