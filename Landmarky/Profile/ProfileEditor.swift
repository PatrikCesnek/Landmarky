//
//  ProfileEditor.swift
//  Landmarky
//
//  Created by Patrik Cesnek on 31/08/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
        HStack {
            Text("Používateľské meno").bold()
            Divider()
            TextField("Používateľské meno", text: $profile.username)
        }
        
        Toggle(isOn: $profile.prefersNotifications) {
            Text("Povoliť Notifikácie")
        }
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Seasonal Photo").bold()
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases, id: \.self) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.top)
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Dátum Cieľa").bold()
            DatePicker(
                "Dátum cieľa",
                selection: $profile.goalDate,
                in: dateRange,
                displayedComponents: .date)
        }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
