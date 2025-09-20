//
//  ActionSheetBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 9/15/25.
//

import SwiftUI

struct ActionSheetBasic: View {
  
  @State var showActionSheet = false
  @State var resultActinoSheet = ""
  
    var body: some View {
      VStack {
        Text(resultActinoSheet)
          .font(.largeTitle)
        
        Spacer()
        
        // content
        
        HStack {
          Circle()
            .frame(width: 30, height: 30)
          
          Text("Jacob Ko")
          
          Spacer()
          
          Button {
            showActionSheet.toggle()
          } label: {
            Image(systemName: "ellipsis")
            
          }
        } // hstack
        .padding(.horizontal)
        
        Rectangle()
          .aspectRatio(1.0, contentMode: .fit)
        
        Spacer()
     } //vstack
      .confirmationDialog("Title", isPresented: $showActionSheet, actions: {
        // 내용
        Button {
          resultActinoSheet = "공유 되었습니다."
        } label: {
          Text("공유하기")
        }
        
        Button("신고하기", role: .destructive){
          resultActinoSheet = "신고 되었습니다"
        }
        
        Button {
          resultActinoSheet = "삭제 되었습니다."
        } label: {
          Text("삭제하기")
        }
      },
                          message: { Text("여기는 decription 자리") }
      )
      
    }
  
}

#Preview {
    ActionSheetBasic()
}
