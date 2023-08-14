//
//  ATTASwiftUIApp.swift
//  ATTASwiftUI
//
//  Created by Jacob Bartlett on 13/08/2023.
//

import SwiftUI

@main
struct ATTASwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                DumbbellView()
                    .tabItem {
                        Label("", systemImage: "dumbbell.fill")
                    }
                
                CourtsideView()
                    .tabItem {
                        Label("", systemImage: "sportscourt.fill")
                    }
                
                DeadliftView()
                    .tabItem {
                        Label("", systemImage: "figure.strengthtraining.traditional")
                    }
            }
            .tint(.white)
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .gray
            }
        }
    }
}
