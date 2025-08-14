//
//  IconBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/14/25.
//

import SwiftUI

struct IconBasic: View {
    var body: some View {
      VStack(spacing: 20) {
        Image(systemName: "person.fill.badge.plus")
          .resizable() // 크기를 화면사이즈에 가장 크게 함
        // rendermode 에서 original 로 하게 되면 실제 color 에서 multi color로 변경
        // 즉 고유 값 컬러로 변경되어서 color를 변경하더라도 변경되지 않는 컬러 값이 된다.
          .renderingMode(.original)
          .scaledToFit()
          .foregroundStyle(Color.red)
          .frame(width: 300, height: 300)
         
      }
    }
}

#Preview {
    IconBasic()
}
