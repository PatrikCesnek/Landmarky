//
//  UserData.swift
//  Landmarky
//
//  Created by Patrik Cesnek on 26/08/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
