//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by 최수훈 on 9/23/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50 )
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//#Preview("Turtle Rock") {
//    LandmarkRow(landmark: landmarks[0])
//}
//
//#Preview("Salmon") {
//    LandmarkRow(landmark: landmarks[1])
//}

#Preview {
    let landmark = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmark[0])
        LandmarkRow(landmark: landmark[1])
    }
}
