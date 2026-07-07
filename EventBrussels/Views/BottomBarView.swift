//
//  BottomBarView.swift
//  EventBrussels
//
//  Created by Harry on 05/07/2026.
//

import SwiftUI

enum AppTab {
    case discover
    case map
    case saved
    case settings
}

struct BottomBarView: View {
    @State private var selectedTab: AppTab = .discover
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                DiscoverView()
            }
            .tabItem {
                Label("Discover", systemImage: "safari.fill")
            }
            .tag(AppTab.discover)
            
            NavigationStack {
                MapView()
            }
            .tabItem {
                Label("Map", systemImage: "map.fill")
            }
            .tag(AppTab.map)
            
            NavigationStack {
                SavedView(selectedTab: $selectedTab)
            }
            .tabItem {
                Label("Saved", systemImage: "heart.fill")
            }
            .tag(AppTab.saved)
            
            NavigationStack {
                Text("Settings")
                    .navigationTitle("Settings")
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            .tag(AppTab.settings)
        }
    }
}

#Preview {
    BottomBarView()
        .environmentObject(EventListViewModel())
}
