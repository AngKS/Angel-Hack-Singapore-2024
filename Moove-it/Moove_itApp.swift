//
//  Moove_itApp.swift
//  Moove-it
//
//  Created by Ang KS on 24/5/24.
//

import SwiftUI

@main
struct Moove_itApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            Homepage()
                .environmentObject(locationViewModel)
        }
    }
}
