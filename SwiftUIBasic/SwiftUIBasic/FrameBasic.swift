//
//  FrameBasic.swift
//  SwiftUIBasic
//
//  Created by Jacob Ko on 2022/07/30.
//

import SwiftUI

/*
 [UPDATE: 1/24/2024] xcode 15 이후 부터 preview 가 업데이트 되어서 강의와 같이 3번 부분이 Preview 가 제대로 출력 되지 않는 부분이 있습니다. 아래와 같이 #Preview 를 2개 만들어서 다른 struct 파일안에 VStack 생성해서 진행하시면 강의 내용과 같이 진행 됩니다.
 */

struct FrameBasic: View {
    var body: some View {
        // 1
		VStack (spacing: 20) {
			Text("Hello, World!")
				.font(.title)
				.background(Color.green)
				.frame(width: 200, height: 200, alignment: .center)
				.background(Color.red)
		
		Divider()
		// 2
			Text("Hello, World!")
				.font(.title)
				.background(Color.green)
				.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
       // infinity의 기준은? 그러니까, 화면의 남은공간이 infinity의 기준인건지?
				.background(Color.red)
      
				
		}
    }
}

struct FrameBasic2: View {
    var body: some View {
        // 3
        VStack (spacing: 20) {
            Text("Hello, World")
                .font(.title)
                .background(Color.red)
                .frame(height: 100, alignment: .top)
                .background(Color.orange)
                .frame(width: 200)
                .background(Color.purple)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.pink)
                .frame(height: 400)
                .background(Color.green)
                .frame(maxHeight: .infinity, alignment: .top)
                .background(Color.yellow)
                
        }
        .ignoresSafeArea()
    }
}

// XCode 15 (iOS 17) 이후 PreView 변경 적용
#Preview {
    FrameBasic()
}

#Preview {
    FrameBasic2()
}






