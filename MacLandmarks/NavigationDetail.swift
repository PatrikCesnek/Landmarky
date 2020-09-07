//
//  NavigationDetail.swift
//  MacLandmarks
//
//  Created by Patrik Cesnek on 01/09/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI
import MapKit

struct NavigationDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 250)
                    .overlay(
                        GeometryReader { proxy in
                            Button("Otvoriť v mapách") {
                                let destination = MKMapItem(placemark: MKPlacemark(coordinate: self.landmark.locationCoordinate))
                                destination.name = self.landmark.name
                                destination.openInMaps()
                            }
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                            .offset(x: -10, y: -10)
                        }
                )
                
                HStack(alignment: .center, spacing: 24) {
                    CircleImage(image: landmark.image.resizable(), shadowRadius: 4)
                        .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name).font(.title)
                            
                            Button(action: {
                                self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                            }) {
                                if userData.landmarks[self.landmarkIndex].isFavorite {
                                    Image("star-filled")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.yellow)
                                        .accessibility(label: Text("Odstrániť z obľúbených"))
                                } else {
                                    Image("star-empty")
                                        .resizable()
                                        .renderingMode(.template)
                                        .foregroundColor(.gray)
                                        .accessibility(label: Text("Pridať do obľúbených"))
                                }
                            }
                            .frame(width: 20, height: 20)
                            .buttonStyle(PlainButtonStyle())
                        }
                        Text(landmark.place)
                        Text(landmark.city)
                    }
                    .font(.caption)
                }
                Divider()
                
                Text("O mieste \(landmark.name)")
                
                Text(landmark.description)
                .lineLimit(nil)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(x: 0, y: -50)
        }
    }
}

struct NavigationDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDetail(landmark: landmarkData[0])
        .environmentObject(UserData())
    }
}
