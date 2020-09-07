//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Patrik Cesnek on 01/09/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLandmark: Landmark?

    var body: some View {
        NavigationView {
            NavigationPrimary(selectedLandmark: $selectedLandmark)
            
            if selectedLandmark != nil {
                NavigationDetail(landmark: selectedLandmark!)
            }
        }
        .frame(minWidth: 700, minHeight: 300)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserData())
    }
}
