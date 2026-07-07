//
//  SavedView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI

struct SavedView: View {
    
    @EnvironmentObject var eventListViewModel: EventListViewModel
    @Binding var selectedTab: AppTab
    
    var body: some View {
        ZStack {
            if eventListViewModel.savedEventIDs.isEmpty {
                NoSavedEventView(selectedTab: $selectedTab)
            } else {
                List {
                    ForEach(eventListViewModel.events.filter { eventListViewModel.isSaved($0) }) { event in
                        ListRowSavedView(event: event)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color(.systemGroupedBackground))
                .navigationTitle("Your Events")
            }
        }
    }
}

#Preview {
    NavigationView(){
        SavedView(selectedTab: .constant(.saved)).environmentObject(EventListViewModel())
    }
}
