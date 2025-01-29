//
//  DatePlannerApp.swift
//  DatePlanner
//
//  Created by 최수훈 on 1/5/25.
//

import SwiftUI

@main
struct DatePlannerApp: App {
  /*
   StateObject -> Property Wrapper
   1. the @StateObject property wrapper to create an instance of an observable object, EventData
   2. SwiftUI watches it to keep track of any changes to its values. Whenever the data changes, SwiftUI automatically updates all of the views that use (or observe) it.
   
   */
  @StateObject private var eventData = EventData()
    var body: some Scene {
        WindowGroup {
          NavigationView {
            EventList()
            Text("Select an Event")
              .foregroundStyle(.secondary)
          }
          .environmentObject(eventData)
          
          
          /*
           .environmentObject(T)
           To make eventData available to your entire view hierarchy, use the .environmentObject modifier and pass in the eventData instance. Now you can use this data across all of your navigation view’s child views (and their child views as well).
           
           */
        }
    }
}
