//
//  ContentView.swift
//  LandMarks
//
//  Created by 최수훈 on 2023/10/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}
	
#Preview {
    ContentView()
        .environment(ModelData())
}
