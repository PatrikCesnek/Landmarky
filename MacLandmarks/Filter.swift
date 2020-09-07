//
//  Filter.swift
//  MacLandmarks
//
//  Created by Patrik Cesnek on 01/09/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct Filter: View {
    @EnvironmentObject private var userData: UserData
    @Binding var filter: FilterType
    
    var body: some View {
        HStack {
            Picker(selection: $filter, label: EmptyView()) {
                ForEach(FilterType.allCases) { choice in
                    Text(choice.name).tag(choice)
                }
            }
            
             Toggle(isOn: $userData.showFavoritesOnly) {
                 Text("Len obľúbené")
             }
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter(filter: .constant(.all))
            .environmentObject(UserData())
    }
}

struct FilterType: CaseIterable, Hashable, Identifiable {
    var name: String
    var category: Landmark.Category?
    
    init(_ category: Landmark.Category) {
        self.name = category.rawValue
        self.category = category
    }
    
    init(name: String){
        self.name = name
        self.category = nil
    }
    
    static var all = FilterType(name: "Všetko")
    
    static var allCases: [FilterType] {
        return [.all] + Landmark.Category.allCases.map(FilterType.init)
    }
    
    var id: FilterType {
        return self
    }
}
