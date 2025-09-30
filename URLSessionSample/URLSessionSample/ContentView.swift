//
//  ContentView.swift
//  URLSessionSample
//
//  Created by 최수훈 on 9/30/25.
//

import SwiftUI

struct ContentView: View {
  
  @State private var results = [Result]()
  
  var body: some View {
    List(results) { item in
      VStack {
        Text(item.trackName)
          .font(.headline)
        
        Text(item.collectionName)
      }
    }
    .task {
      await loadData()
    }
  }
  
  private func loadData() async {
    guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
        print("Invalid URL")
        return
      }

    do {
      let (data, meta) = try await URLSession.shared.data(from: url)
      print(data)
      
      if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
        results = decodedResponse.results
      }
    } catch {
      print("Invalid Data")
    } //catch
  }
}

#Preview {
    ContentView()
}
