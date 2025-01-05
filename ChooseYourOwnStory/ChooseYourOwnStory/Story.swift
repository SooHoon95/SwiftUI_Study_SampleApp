//
//  Story.swift
//  ChooseYourOwnStory
//
//  Created by 최수훈 on 12/29/24.
//

import SwiftUI


struct Story {
  let pages: [StoryPage]
  
  subscript(_ pageIndex: Int) -> StoryPage {
    return pages[pageIndex]
  }
}

struct StoryPage {
  let text: String
  let choices: [Choice]
  
  init(_ text: String, choices: [Choice]) {
    self.text = text
    self.choices = choices
  }
}

struct Choice {
  let text: String
  let destination: Int
}


