//
//  NotificationView.swift
//  WatchLandmarks Extension
//
//  Created by Patrik Cesnek on 01/09/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI

struct NotificationView: View {
    
    let title: String?
    let message: String?
    let landmark: Landmark?
    
    init(title: String? = nil,
         message: String? = nil,
         landmark: Landmark? = nil) {
        self.title = title
        self.message = message
        self.landmark = landmark
    }
    
    var body: some View {
        VStack {
            if landmark != nil {
                CircleImage(image: landmark!.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Neznáme miesto")
                .font(.headline)
                .lineLimit(0)
            
            Divider()
            
            Text(message ?? "Ste v okruhu 5k od jedného z vašich obľúbených miest.")
                .font(.caption)
                .lineLimit(0)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NotificationView()
            
            NotificationView(title: "Veľká Homola", message: "Ste v okruhu 5k od Veľkej Homoly.", landmark: UserData().landmarks[0])
        }
        .previewLayout(.sizeThatFits)
    }
}
