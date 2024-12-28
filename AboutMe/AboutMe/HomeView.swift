//
//  HomeView.swift
//  AboutMe
//
//  Created by 최수훈 on 12/28/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
  
  var body: some View {
    
    VStack {
      Text("All About")
        .font(.largeTitle)
        .fontWeight(.bold)
        .padding()
      
      Image(information.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .cornerRadius(10)
        .padding(40)
      
      Text(information.name)
        .font(.title)
    }
    
  }
  
  
}
