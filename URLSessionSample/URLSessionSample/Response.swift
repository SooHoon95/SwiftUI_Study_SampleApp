//
//  Response.swift
//  URLSessionSample
//
//  Created by 최수훈 on 9/30/25.
//

import Foundation

struct Response: Codable {
  var results: [Result]
}

struct Result: Codable, Identifiable {
  var id: Int { trackId }
  var trackId: Int
  var trackName: String
  var collectionName: String
}
