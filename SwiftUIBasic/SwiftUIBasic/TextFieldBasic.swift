//
//  TextFieldBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 9/15/25.
//

import SwiftUI

struct TextFieldBasic: View {
  @State var inputText = ""
  @State var userName: [String] = []
  
    var body: some View {
      NavigationView {
        VStack(spacing: 20) {
          // TextField 적은양의 text 입력시 사용
//          TextField("최소 2글자 이상 입력", text: $inputText)
//            .padding()
//            .background(Color.gray.opacity(0.3))
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .font(.headline)
          
          // TextEditor - 긴글의 Text를 입력 시 사용
          TextEditor(text: $inputText)
            .frame(height: 250)
            .colorMultiply(Color.gray.opacity(0.5))
          
          Button {
            // 이름 2글자 이상일떄 saveText 되도록 설정
            if isTextEnough() {
              saveText()
            }
          } label: {
            Text("Save".uppercased())
              .padding()
              .frame(maxWidth: .infinity)
              .background(isTextEnough() ? Color.blue : Color.gray)
              .clipShape(RoundedRectangle(cornerRadius: 10))
              .foregroundStyle(.white)
              .font(.headline)
          }
          .disabled(!isTextEnough())
          
          ForEach(userName, id: \.self) { item in
              Text(item)
          }
          
          Spacer()
        }
        .padding()
        .navigationTitle("키미노 나마에와?")
      }// navigation
    }
  
  private func isTextEnough() -> Bool {
    if inputText.count > 2 {
      return true
    }
    return false
  }
  
  private func saveText() {
    userName.append(inputText)
    inputText = ""
  }
}

#Preview {
    TextFieldBasic()
}
