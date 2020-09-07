//
//  ProfileSummary.swift
//  Landmarky
//
//  Created by Patrik Cesnek on 31/08/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.headline)
            
            Text("Notifikácie: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Sezónne fotografie: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Dátum cieľa: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) {
                Text("Dokončené odznaky")
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadge(name: "Prvá túra")
                        
                        HikeBadge(name: "Deň Zeme")
                            .hueRotation(Angle(degrees: 90))
                        
                        HikeBadge(name: "Desiata túra")
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            VStack(alignment: .leading) {
                Text("Nedávna túra")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
