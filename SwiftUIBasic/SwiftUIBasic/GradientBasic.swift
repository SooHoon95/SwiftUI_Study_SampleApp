//
//  GradientBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/14/25.
//

import SwiftUI

struct GradientBasic: View {
    var body: some View {
      VStack(spacing: 20) {
        
        // Linear // 선형 그래디언트
        Text("Linear Gradient")
          .font(.title2)
        
        RoundedRectangle(cornerRadius: 25)
          .fill(
            LinearGradient(
              gradient: Gradient(colors: [Color.red, Color.blue]),
              startPoint: .topLeading,
              endPoint: .bottom
            )
          )
          .frame(width: 300, height: 200)
        
        // Radial Gradient: 원형
        Text("Radial Gradient")
          .font(.title2)
        
        RoundedRectangle(cornerRadius: 25)
          .fill(
            RadialGradient(
              gradient: Gradient(colors: [Color.yellow, Color.purple]),
              center: .leading, // 원형의 중심점
              startRadius: 5,
              endRadius: 300 // 얼마나 퍼져나갈지
            )
          )
          .frame(width: 300, height: 200)
        
        // Anfular Gradient // 각도로 조절 가능
        Text("Anfular Gradient")
          .font(.title2)
        
        RoundedRectangle(cornerRadius: 25)
          .fill(
            AngularGradient(
              gradient: Gradient(colors:[Color.blue, Color.green]),
              center: .topLeading,
              angle: .degrees(180 + 45)
            )
          )
          .frame(width: 300, height: 200)
      }
      
      
    }
}

#Preview {
    GradientBasic()
}
