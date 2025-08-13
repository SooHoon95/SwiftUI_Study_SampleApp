//
//  TextBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/13/25.
//

import SwiftUI

struct TextBasic: View {
  var body: some View {
    VStack(spacing: 20) {
      // Font size -> title, body, footnote ... etc 등으로 정하면 responsive 하게 보일 수 있음
      Text("Hello, Wolrd!")
        .font(.title)
        .fontWeight(.semibold)
        .bold() // fontweight(.bold)
        .underline(color: Color.red)
        .italic()
        .strikethrough(true, color: Color.green) // 가운데 선
        
      /* 아래 방법은 text 크기를 지정할 수 있음
        - 아이패드, 아이폰 상관없이 폰트 사이즈가 고정 된다
       */
      Text("Hello, Wolrd2".uppercased())
        .font(.system(size: 25,
                      weight: .semibold,
                      design: .serif))
      
      
      // multiline text alighment
      Text(" 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다. 멀티라인 텍스트 정렬입니다.")
        .multilineTextAlignment(.center)
        .foregroundStyle(Color.red) // foregroundColor 대신
    }
  }
}

#Preview {
  TextBasic()
}
