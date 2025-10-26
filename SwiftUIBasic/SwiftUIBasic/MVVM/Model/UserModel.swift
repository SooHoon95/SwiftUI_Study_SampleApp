//
//  UserModel.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 10/20/25.
//

import Foundation

struct UserModel: Identifiable {
  let id: String = UUID().uuidString
  let displayName: String
  let userName: String
  let followerCount: Int
  let isChecked: Bool
}
