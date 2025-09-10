//
//  SecondNavigationView.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct SecondNavigationView: View {
  
  // property
  @Environment(\.presentationMode) var presentationMode
  
    var body: some View {
      ZStack {
        Color.green.ignoresSafeArea()
          .navigationTitle("2 page")
          
        VStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Text("fore pafe go ")
              .font(.largeTitle)
          }
          
          NavigationLink {
            ZStack {
              Color.red.ignoresSafeArea()
              Text("3rd Page")
                .font(.largeTitle)
            }
          } label : {
            Text("3번째 페이지로 이동")
              .foregroundStyle(.green)
              .font(.headline)
              .padding()
              .background(.white)
              .clipShape(RoundedRectangle(cornerRadius: 10))
          }
        }
      }
    }
}

#Preview {
  NavigationView {
    SecondNavigationView()
  }
}
