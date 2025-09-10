//
//  BackgroundOverlayBasic.swift
//  SwiftUIBasic
//
//  Created by 최수훈 on 8/14/25.
//

import SwiftUI

struct BackgroundOverlayBasic: View {
    var body: some View {
      VStack(spacing: 20 ) {
        // Background
        Text("Hello world!")
          .frame(width: 100, height: 100)
          .background(
            Circle()
              .fill(
                LinearGradient(gradient: Gradient(colors: [Color.red,Color.blue]),
                               startPoint: .leading,
                               endPoint: .trailing)
              )
          )
          .frame(width: 120, height: 120)
          .background(
            Circle()
              .fill(Color.red)
          )
        Divider()
        
        
        // Overlay
        Circle()
          .fill(Color.pink)
          .frame(width: 100,height: 100)
          .overlay {
            Text("1")
              .font(.title)
              .foregroundStyle(Color.white)
          }
          .background(Circle()
            .fill(Color.purple)
            .frame(width: 120,height: 120)
          )
        
        Divider()
        
        // Background and Overlay
        Rectangle()
          .frame(width: 200,height: 200)
          .overlay (
            Rectangle()
              .fill(Color.blue)
              .frame(width: 100, height: 100)
            , alignment: .leading
          )
          .background(
            Rectangle()
              .fill(Color.red)
              .frame(width: 250, height: 250)
            )
          .padding()
            
            Image(systemName: "heart.fill")
              .font(.system(size: 40))
              .foregroundStyle(Color.white)
              .background(
                Circle()
                  .fill(
                    LinearGradient(gradient: Gradient(colors: [Color.cyan, Color.blue]),
                                   startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                  .frame(width: 100, height: 100)
                  .shadow(color: Color.blue, radius: 10, x: 0, y: 10)
                  .overlay(
                    Circle()
                      .fill(Color.red)
                      .frame(width: 35 ,height:  35)
                      .overlay(
                        Text("2")
                          .font(.headline)
                          .foregroundStyle(Color.white)
                      ).shadow(color: Color.red, radius: 10, x: 5, y: 5)
                    , alignment: .bottomTrailing
                  )
              )
              .padding()
          
      }
    }
}

#Preview {
    BackgroundOverlayBasic()
}
