//
//  DiscoverView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI

struct DiscoverView: View {
    
    @EnvironmentObject var eventListViewModel: EventListViewModel
    
    var body: some View {
        List {
            ForEach(eventListViewModel.events) { event in
                ListRowView(event: event)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Events")
    }
}


#Preview {
    NavigationView{
        DiscoverView().environmentObject(EventListViewModel())
    }
}
