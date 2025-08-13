//
//  MemoView.swift
//  DevLifMemo
//
//  Created by 최수훈 on 5/11/25.
//
import SwiftUI

struct MemoView: View {
  var memoNumber = 1
  var memoTitle: String = "memoTitlememoTitlememoTitle"
  var body: some View {
    HStack {
      Text("\(memoNumber) - \(memoTitle)")
        .frame(width: .infinity, alignment: .leading)
        .padding([.leading], 20)
        .padding([.bottom], 10)
      Spacer()
    }
  }
}


#Preview {
  MemoView()
}
