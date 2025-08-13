//
//  ShapeBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/13/25.
//

import SwiftUI

struct ShapeBasic: View {
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("원형")
          .font(.title)
        Circle()
        //        .fill(Color.blue)
        //        .foregroundStyle(Color.pink)
        //        .stroke(Color.red, lineWidth: 20) // 외곽 선
        //        .stroke(Color.purple, style: StrokeStyle(lineWidth: 30, lineCap: .square, dash: [30]))
          .trim(from: 0.2, to: 1.0) // 잘라내기
          .stroke(Color.purple, lineWidth: 50)
          .frame(width: 200, height: 100, alignment: .center) // center = default
          .padding()
        
        // Elipse 타원형
        Text("타원형")
          .font(.title)
        
        Ellipse()
          .fill(Color.green)
          .frame(width: 200, height: 100)
        
        // 캡슐형
        Text("캡슐형")
          .font(.title)
        Capsule(style: .circular)
          .stroke(Color.blue, lineWidth: 30)
          .frame(width: 200, height: 100)
        
        Text("직사각형")
          .font(.title)
        
        Rectangle()
          .fill(Color.red)
          .frame(width: 200, height: 100)
        
        Text("둥근 직사각형")
          .font(.title)
        
        RoundedRectangle(cornerRadius: 20)
          .trim(from: 0.4, to: 1.0)
          .frame(width: 300, height: 200)
      }
    }
  }
}


#Preview {
  ShapeBasic()
}
