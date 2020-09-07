//
//  LandmarkRow.swift
//  MacLandmarks
//
//  Created by Patrik Cesnek on 01/09/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack(alignment: .center) {
            landmark.image
            .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 32, height: 32)
                .fixedSize(horizontal: true, vertical: false)
                .cornerRadius(4)
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)

                Text(landmark.place)
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image("star-filled")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.yellow)
                    .frame(width: 10, height: 10)
            }
        }
        .padding(.vertical, 4)
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landmark: landmarkData[0])
    }
}
