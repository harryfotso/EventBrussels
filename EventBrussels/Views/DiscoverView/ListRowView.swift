//
//  ListRowView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI

struct ListRowView: View {
    
    let event: EventModel
    
    var body: some View {
        HStack {
            NavigationLink(destination: EventDetailView(event: event)){
                Text(event.title)
            }
        }
    }
}


#Preview {
    ListRowView(
        event: EventModel(
            id: UUID(),
            title: "Brussels Jazz Night",
            description: "Live jazz concert in Brussels",
            category: .culture,
            startDate: Date(),
            endDate: Date(),
            locationName: "Flagey",
            address: "Place Sainte-Croix, Brussels",
            latitude: 50.8276,
            longitude: 4.3723,
            isFree: false,
            price: 15.0,
            ageRestriction: "All ages",
            imageURL: nil,
            websiteURL: nil
        )
    )
}
