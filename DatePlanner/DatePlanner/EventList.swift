//
//  EventList.swift
//  DatePlanner
//
//  Created by 최수훈 on 1/5/25.
//

import SwiftUI

struct EventList: View {
  @EnvironmentObject var eventData: EventData
  @State private var isAddingNewEvent = false
  @State private var newEvent = Event()
  
  var body: some View {
    
    List {
      ForEach(Period.allCases) { period in
        if !eventData.sortedEvents(period: period).isEmpty {
          Section(content:  {
            ForEach(eventData.sortedEvents(period: period)) { $event in
              NavigationLink {
                EventEditor(event: $event)
              }
            }
          })
        }
      }
    }
  }
}
