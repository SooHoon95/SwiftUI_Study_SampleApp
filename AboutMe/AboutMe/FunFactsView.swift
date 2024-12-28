//
//  FunFactsView.swift
//  AboutMe
//
//  Created by 최수훈 on 12/28/24.
//

import Foundation
import SwiftUI

struct FunFactsView: View {
  
  @State private var funFact = "fun Fact"
  
  var body: some View {
    VStack {
      Text("Fun Facts")
        .font(.largeTitle)
        .fontWeight(.bold)
      
      Text(funFact)
        .padding()
        .font(.title)
        .frame(minHeight: 400)
      
      Button("Show Random Fact") {
        funFact = information.funFacts.randomElement()!
      }
    }
    .padding()
  }
  
}

