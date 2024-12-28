//
//  LandMarksApp.swift
//  LandMarks
//
//  Created by 최수훈 on 2023/10/31.
//

import SwiftUI

@main
struct LandMarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
