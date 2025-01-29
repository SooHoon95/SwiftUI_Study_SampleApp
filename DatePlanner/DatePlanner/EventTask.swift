//
//  EventTask.swift
//  DatePlanner
//
//  Created by 최수훈 on 1/5/25.
//

import Foundation


struct EventTask: Identifiable, Hashable {
  var id = UUID()
  var text: String
  var isCompleted = false
  var isNew = false
}
