//
//  ContextMenuBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 9/15/25.
//

import SwiftUI

struct ContextMenuBasic: View {
  
  @State var statusText: String = ""
  @State var background: Color = Color.cyan
  
    var body: some View {
      VStack(spacing: 30) {
        Text(statusText)
        
        VStack(alignment: .leading, spacing: 10) {
          Text("ContextMenu Test")
          
          Text("이 버튼을 길게 누르면 메뉴가 나타납니댜")
            .font(.subheadline)
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(background)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contextMenu {
          Button {
            background = .yellow
            statusText = "공유가 되었습니다"
          } label: {
            Label {
              //title
              Text("Share Post")
            } icon: {
              Image(systemName: "square.and.arrow.up")
            }

          }
          
          Button {
            background = .red
            statusText = "신고가 접수 되었습니다"
          } label: {
            Label {
              //title
              Text("Report Post")
            } icon: {
              Image(systemName: "exclamationmark.bubble")
            }

          }
          
          
          Button {
            background = .green
            statusText = "좋아요 추가"
          } label: {
            Label {
              //title
              Text("Share Post")
            } icon: {
              Image(systemName: "hand.thumbsup")
            }

          }
        }
      }
    }
}

#Preview {
    ContextMenuBasic()
}
