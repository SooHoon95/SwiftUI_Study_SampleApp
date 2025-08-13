//
//  ColorBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/13/25.
//

import SwiftUI
struct ColorBasic: View {
  var body: some View {
    VStack(spacing: 20) {
      Text("Basic Color")
        .font(.title)
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.purple)
        .frame(width: 300, height: 100)
      
      // Primary Color -> 자동으로 다크모드 지원
      Text("Primary Color")
        .font(.title)
      
      RoundedRectangle(cornerRadius: 25)
        .fill(Color.primary) // default 검은색
//        .fill(Color.secondary) // default 회색
        .frame(width: 300, height: 100, alignment: .center)
      
      /*
       - UIColor
       - UIKit 에서 사용되는 color 값 사용 가능
       */
      Text("UI Color")
        .font(.title)
      RoundedRectangle(cornerRadius: 25)
        .fill(Color(UIColor.secondarySystemBackground))
        .frame(width: 300, height: 100)
      
      // Custom Color
      // Asset 에서 Color set 을 미리 설정 한 색을 사용할 수 있습니다.
      Text("Custom Color")
        .font(.title)
      RoundedRectangle(cornerRadius: 25)
        .fill(Color("CustomColor"))
        .frame(width: 300, height: 100)
    }
  }
}


#Preview {
  ColorBasic()
    .preferredColorScheme(.dark)
}
