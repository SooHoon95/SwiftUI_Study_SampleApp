//
//  AnimationBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct AnimationBasic: View {
  
  @State var isAnimated = false
  
  let timing = 5.0
  
    var body: some View {
      VStack {
        Button {
          withAnimation(.default
//            .repeatForever()
//            .repeatCount(5)
            .delay(1.0)
          ) {
            isAnimated.toggle()
          }
        } label: {
          Text("Button")
        }
        
        Spacer()
        
        RoundedRectangle(cornerRadius: isAnimated ? 50 : 0)
          .fill(isAnimated ? Color.red : Color.green)
          .frame(
            width: isAnimated ? 100: 300,
            height: isAnimated ? 100: 300
          )
          .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
          .offset(y: isAnimated ? 300 : 0)
        
        Spacer()
      }
      
    }
}


struct AnimationBasic2: View {
  
  @State var isAnimated = false
  let timing = 5.0
  var body: some View {
    VStack {
      Button {
        isAnimated.toggle()
      } label: {
        Text("Button")
      }
      
      RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.linear(duration: timing), value: isAnimated)
      
      RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeIn(duration: timing), value: isAnimated)
      
      RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeOut(duration: timing), value: isAnimated)
      
      RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        .animation(.easeInOut(duration: timing), value: isAnimated)
      
      
    }
  }
}

struct AnimationBasic3: View {
  
  @State var isAnimated = false
  let timing = 5.0
  var body: some View {
    VStack {
      Button {
        withAnimation(
          .spring(response: 0.5, // 단일 진동을 완료하는 데 걸리는 시간
                  dampingFraction: 0.5, // 얼마나 빠르게 스프링이 정지하는 속도제어. 만약 0이면 영원히 멈추지 않음
                  blendDuration: 0)) { // 다른 애니메이션 간의 전환 길이 제어
                    isAnimated.toggle()
                  }
      } label: {
        Text("Button")
      }
      RoundedRectangle(cornerRadius: 20)
        .frame(width: isAnimated ? 350 : 50, height: 100)
        
      
    }
  }
}

#Preview {
    AnimationBasic()
}

#Preview {
    AnimationBasic2()
}


#Preview {
    AnimationBasic3()
}
