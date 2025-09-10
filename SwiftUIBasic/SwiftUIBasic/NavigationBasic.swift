//
//  NavigationBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct NavigationBasic: View {
  @State var showSheet: Bool = false
    var body: some View {
      NavigationView {
        VStack {
          // 네비게이션을 관리하는 버튼
          NavigationLink {
            // destination: 목적지 어디로 이동하는가
            SecondNavigationView()
          } label: {
            Text("Second NavigationView 이동")
              .foregroundStyle(Color.white)
              .font(.headline)
              .padding()
              .background(Color.blue)
              .clipShape(RoundedRectangle(cornerRadius: 10))
          }

        } // VStack
        .navigationTitle("페이지 제목")
        // navigationBarTitleDisPlaytMode - 상단페이지 제목의 스타일
        // .automatic, inline - 상단에 작게, large: leading쪽으로 크게
        .navigationBarTitleDisplayMode(.automatic)
//        .navigationBarHidden(false)
        
        .navigationBarItems(leading: Image(systemName: "line.3.horizontal"),
                            trailing: Button(action: {
          showSheet.toggle()
        }, label: {
          Image(systemName: "gear")
        }))
      } // navigationTitle - 상단 페이지 제목
      .sheet(isPresented: $showSheet) {
        Color.green.ignoresSafeArea()
        Text("setting page")
          .font(.largeTitle)
      }
    }
}

#Preview {
    NavigationBasic()
}
