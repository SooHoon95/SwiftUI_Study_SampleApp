//
//  AlertBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 9/10/25.
//

import SwiftUI

struct AlertBasic: View {
  @State var showAlert1 = false
  @State var showAlert2 = false
  @State var showAlert3 = false
  @State var showAlert4 = false
  
  @State var backgroundColor: Color = Color.yellow
  @State var alertTitle: String = ""
  @State var alertMessage: String = ""
  @State var alertType: AlertCase? = nil
  
  enum AlertCase {
    case success
    case error
  }
  
  var body: some View {
    ZStack {
      backgroundColor.ignoresSafeArea()
      
      VStack(spacing: 20) {
        Button {
          showAlert1.toggle()
        } label: {
          Text("1번 Alert")
        }
        .alert(isPresented: $showAlert1) {
          Alert(title: Text("패스워드 에러입니다. 다시 확인하세요"))
        }
        
        Button {
          showAlert2.toggle()
        } label: {
          Text("2번 Alert")
        }
        .alert(isPresented: $showAlert2) {
          getAlert2()
        }
        
        HStack(spacing: 10) {
          
          Button {
            alertTitle = "영상이 업로드 에러"
            alertMessage = "영상이 제대로 안올라감. 다시 확인"
            showAlert3.toggle()
          } label: {
            Text("3번 Alert 실패시")
          }
          
          Button {
            alertTitle = "업로드 성공"
            alertMessage = "제대로 올라갔음 영상"
            showAlert3.toggle()
          } label: {
            Text("3번 Alert 성공시")
          }
          .alert(isPresented: $showAlert3) {
            getAlert3()
          }
        }
        
        HStack(spacing: 10) {
          
          Button {
            alertType = .error
            alertTitle = "영상이 업로드 에러"
            alertMessage = "영상이 제대로 안올라감. 다시 확인"
            showAlert4.toggle()
          } label: {
            Text("4번 Alert 실패시")
          }
          
          Button {
            alertType = .success
            alertTitle = "업로드 성공"
            alertMessage = "제대로 올라갔음 영상"
            showAlert4.toggle()
          } label: {
            Text("4번 Alert 성공시")
          }
          .alert(isPresented: $showAlert4) {
            getAlert4()
          }
        }
      }
    }
  }
  
  private func getAlert2() -> Alert {
    return Alert(title: Text("메세지 삭제"),
                 message: Text("정말 메세지 삭제 할거?"),
                 primaryButton: .destructive(Text("Delete"), action: {
      backgroundColor = .red
    }),
                 secondaryButton: .cancel())
  }
  
  private func getAlert3() -> Alert {
    return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
  }
  
  private func getAlert4() -> Alert {
    switch alertType {
    case .error:
      return Alert(title: Text("에러발생 다시 확인하세요"), dismissButton: .default(Text("OK"), action: {
        backgroundColor = .red
      }))
    case .success:
      return Alert(title: Text("로그인에 성공했습니다"), dismissButton: .default(Text("OK"), action: {
        backgroundColor = .green
      }))
    default:
      return Alert(title: Text("에러"))
    }
  }
}

#Preview {
  AlertBasic()
}
