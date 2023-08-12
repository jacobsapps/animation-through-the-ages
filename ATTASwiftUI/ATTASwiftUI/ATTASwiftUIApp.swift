//
//  ATTASwiftUIApp.swift
//  ATTASwiftUI
//
//  Created by Jacob Bartlett on 11/08/2023.
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
                
                DumbbellView()
                    .tabItem {
                        Label("", systemImage: "dumbbell.fill")
                    }
                
                DumbbellView()
                    .tabItem {
                        Label("", systemImage: "dumbbell.fill")
                    }
            }
            .tint(.white)
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .gray
            }
        }
    }
}
