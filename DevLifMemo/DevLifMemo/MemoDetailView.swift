//
//  MemoDetailView.swift
//  DevLifMemo
//
//  Created by 최수훈 on 5/17/25.
//

import SwiftUI

struct MemoDetailView: View {
  let memo: MemoItem
  var body: some View {
    VStack {
      Text("\(memo.number). \(memo.title)")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding()
      
      Text("\(memo.description)")
      Spacer()
    }
  }
}

#Preview {
  MemoDetailView(memo: MemoItem(number: 1, title: "memo 1", description: "This is number 1 Memo"))
}
