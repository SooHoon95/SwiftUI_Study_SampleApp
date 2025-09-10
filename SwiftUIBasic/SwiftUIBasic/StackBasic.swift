//
//  StackBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/17/25.
//

import SwiftUI

struct StackBasic: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      Rectangle()
        .fill(Color.red)
        .frame(width: 200,height: 200)
      
      Rectangle()
        .fill(Color.green)
        .frame(width: 150, height: 150)
      
      Rectangle()
        .fill(Color.orange)
        .frame(width: 100, height: 100)
    }
    
  }
  
}

struct HstackView: View {
  var body: some View {
    HStack(spacing: 20) {
      Rectangle()
        .fill(Color.red)
        .frame(width: 100, height: 100)
      
      Rectangle()
        .fill(Color.green)
        .frame(width: 100, height: 100)
      
      Rectangle()
        .fill(Color.orange)
        .frame(width: 100, height: 100)
    }
  }
}

struct ZStackView: View {
  var body: some View {
    
    ZStack(alignment: .topLeading) {
      Rectangle()
        .fill(Color.red)
        .frame(width: 150, height: 150)
      
      Rectangle()
        .fill(Color.green)
        .frame(width: 130, height: 130)
      
      Rectangle()
        .fill(Color.orange)
        .frame(width: 100, height: 100)
    }
  }
}

struct ZStack2 : View {
  var body: some View {
    ZStack(alignment: .top) {
      Rectangle()
        .fill(Color.yellow)
        .frame(width: 350, height: 500)
      
      VStack(alignment: .leading, spacing: 30) {
        Rectangle()
          .fill(Color.red)
          .frame(width: 150, height: 150)
        
        Rectangle()
          .fill(Color.green)
          .frame(width: 100, height: 100)
        
        HStack(alignment: .bottom, spacing: 10) {
          Rectangle()
            .fill(Color.purple)
            .frame(width: 50, height: 50)
          
          Rectangle()
              .fill(Color.pink)
              .frame(width: 75, height: 75)
          
          Rectangle()
              .fill(Color.blue)
              .frame(width: 25, height: 25)
        }
        .background(Color.white)
      }
      .background(Color.black)
    }
  }
}

struct ZStack3: View {
  var body: some View {
    // 5.ZStack vs Background
    
    VStack(spacing: 50) {
        // ZStack 을 사용해서 원에 1을 표현 - layer 가 복잡할때 ZStack 사용하면 좋음
        ZStack {
            Circle()
                .frame(width: 100, height: 100)
            
            Text("1")
                .font(.title)
                .foregroundColor(.white)
        }
        
        // Background 를 사용해서 원에 1을 동일하게 표현 - layer 가 단순할 경우 추천
        Text("1")
            .font(.title)
            .foregroundColor(.white)
            .background(
                Circle()
                    .frame(width: 100, height: 100)
            )
    }
  }
}

#Preview {
  StackBasic()
}

#Preview {
  HstackView()
}

#Preview {
  ZStackView()
}

#Preview {
  ZStack2()
}

#Preview {
  ZStack3()
}


