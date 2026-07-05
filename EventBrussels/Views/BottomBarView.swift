//
//  BottomBarView.swift
//  EventBrussels
//
//  Created by Harry on 05/07/2026.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        Group {
            if #available(iOS 26, *){
                NativeTabView()
            } else {
                NativeTabView()
            }
        }
    }
    
    @ViewBuilder
    func NativeTabView() -> some View {
        TabView {
            Tab.init("Discover", systemImage: "safari.fill"){
                NavigationStack {
                    DiscoverView()
                }
            }
            Tab.init("Map", systemImage: "map.fill"){
                NavigationStack {
                    MapView()
                }
            }
            Tab.init("Saved", systemImage: "heart.fill"){
                NavigationStack {
                    SavedView()
                }
            }
            Tab.init("Settings", systemImage: "gearshape.fill"){
                NavigationStack {

                }
            }
        }
    }
}

#Preview {
    BottomBarView()
        .environmentObject(EventListViewModel())
}
