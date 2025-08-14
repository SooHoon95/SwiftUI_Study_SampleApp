//
//  ImageBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/14/25.
//

import SwiftUI

struct ImageBasic: View {
    var body: some View {
      VStack(spacing: 20) {
        Image("nature")
          .resizable()
          .scaledToFill()
          .frame(width: 300, height: 300)
          .clipShape(RoundedRectangle(cornerRadius: 150))
        
        Divider()
        
        Image("nature")
          .resizable()
          .scaledToFill()
          .frame(width: 300, height: 300)
          .clipShape(Circle())
        
      }
    }
}

#Preview {
    ImageBasic()
}
