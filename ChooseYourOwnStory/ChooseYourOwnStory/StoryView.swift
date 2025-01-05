//
//  StoryView.swift
//  ChooseYourOwnStory
//
//  Created by 최수훈 on 12/29/24.
//

import Foundation
import SwiftUI

struct StoryView: View {
  var body: some View {
    NavigationStack {
      StoryPageView(story: story, pageIndex: 0)
    }
  }
}


#Preview {
  StoryView()
}
