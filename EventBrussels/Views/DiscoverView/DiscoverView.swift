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
        ZStack{
            List {
                ForEach(eventListViewModel.events) { event in
                    ListRowView(event: event)
                }
            }
        }
        .navigationTitle("Events")
    }
}


#Preview {
    NavigationView{
        DiscoverView().environmentObject(EventListViewModel())
    }
}
