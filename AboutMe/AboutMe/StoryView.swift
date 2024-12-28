//
//  StoryView.swift
//  AboutMe
//
//  Created by 최수훈 on 12/28/24.
//

import SwiftUI

struct StoryView: View {
  
  var body: some View {
    VStack {
      Text("My Story")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding()
      
      ScrollView {
        Text(information.story)
          .font(.body)
          .padding()
      }
    }
    
    .padding([.top, .bottom], 50)
  }
}
