//
//  SheetBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct SheetBasic: View {
  
  // property
  @State var showSheet: Bool = false
  
    var body: some View {
      ZStack {
        Color.green.ignoresSafeArea()
        
        
        Button {
          showSheet.toggle()
        } label: {
          Text("Button")
            .foregroundStyle(Color.green)
            .font(.headline)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
//        .sheet(isPresented: $showSheet) {
//          SheetBasisc2()
//        }
        .fullScreenCover(isPresented: $showSheet) {
          SheetBasisc2(showSheet: $showSheet)
        }
      }
    }
}

#Preview {
    SheetBasic()
}
