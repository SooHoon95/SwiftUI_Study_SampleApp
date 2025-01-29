//
//  Event.swift
//  DatePlanner
//
//  Created by 최수훈 on 1/5/25.
//

import SwiftUI

/*
 Identifiable
 ->  By conforming to the Identifiable protocol, you ensure that when you create a list of events, SwiftUI can identify and update each row.
 -> 이벤트 객체를 만들고 아이덴티파이어블을 채택함으로써 리스트를 만들 때 SwitUI 가 각 행을 식별하고 업데이트할 수 있도록 보장한다.
 */
struct Event: Identifiable, Hashable {
  var id = UUID()
  var symbol: String = EventSymbols.randomName()
  var color: Color = ColorOptions.random()
  var title = ""
  var tasks = [EventTask(text: "")]
  var date = Date()
  
  var remainingTaskCount: Int {
    tasks.filter { !$0.isCompleted }.count
  }
  
  var isComplete: Bool {
    tasks.allSatisfy { $0.isCompleted }
  }
  
  var isPast: Bool {
    date < Date.now
  }
  
  var isWithinSevenDays: Bool {
    !isPast && date < Date.now.sevenDaysOut
  }
  
  var isWithinSevenToThirtyDays: Bool {
    !isPast && !isWithinSevenDays && date < Date.now.thirtyDaysOut
  }
  
  var isDistant: Bool {
    date >= Date().thirtyDaysOut
  }
  
  static var example = Event(
    symbol: "case.fill",
    title: "Sayulita Trip",
    tasks: [
      EventTask(text: "Buy plane tickets"),
                EventTask(text: "Get a new bathing suit"),
                EventTask(text: "Find an airbnb"),
            ],
            date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5))
  
}

// Convenience methods for dates.
extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
