//
//  StoryPageView.swift
//  ChooseYourOwnStory
//
//  Created by 최수훈 on 12/29/24.
//

import Foundation
import SwiftUI

struct StoryPageView: View {
  
  let story: Story
  let pageIndex: Int
  
  var body: some View {

    VStack {
      ScrollView {
        Text(story[pageIndex].text)
      }
      
      ForEach(story[pageIndex].choices, id: \Choice.text) { choice in
        NavigationLink(destination: StoryPageView(story: story, pageIndex: choice.destination )) {
          Text(choice.text)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color.gray.opacity(0.25))
            .clipShape(RoundedRectangle(cornerRadius: 9))
        }
      }
    }
    .padding()
    .navigationTitle("Page \(pageIndex + 1)")
    .navigationBarTitleDisplayMode(.inline)
  }
}

//#Preview {
//  StoryPageView(story: story, pageIndex: 0)
//}
//



