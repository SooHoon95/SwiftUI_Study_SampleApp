//
//  SheetBasisc2.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/29/25.
//

import SwiftUI

struct SheetBasisc2: View {
  // Binding
//  @Environment(\.presentationMode) var presentationMode
  @Binding var showSheet: Bool
    var body: some View {
      ZStack(alignment: .topLeading) {
        Color.red.ignoresSafeArea()
        
        Button {
//          presentationMode.wrappedValue.dismiss()
          showSheet.toggle()
        } label: {
          Image(systemName: "xmark")
            .foregroundStyle(.white)
            .font(.largeTitle)
            .padding()
        }
        
      }
    }
}

#Preview {
//  SheetBasisc2(showSheet: Binding(projectedValue: true))
}
