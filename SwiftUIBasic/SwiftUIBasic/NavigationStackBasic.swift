//
//  NavigationStackBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct NavigationStackBasic: View {
  
  @State var stack = NavigationPath()
  
    var body: some View {
      NavigationStack(path: $stack) {
        NavigationLink("2 번째 페이지 이동", value: 40)
          .navigationDestination(for: Int.self) { value in
            VStack(spacing: 20) {
              NavigationLink("3번째 페이지로 이동", value: 100)
              Text("나의 나이는 \(value) 입니다")
              Button {
//                stack.removeLast() // 이전페이지로 이동
                stack = .init() // 초기 화면으로 이동
              } label: {
//                Text("이전페이지로 이동하기")
                Text("초기홤녀으로 이동하기")
              }

            }
          }
      }// NavigationStack
    }
}

#Preview {
    NavigationStackBasic()
}
