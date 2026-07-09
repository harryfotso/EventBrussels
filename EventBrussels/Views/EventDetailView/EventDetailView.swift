//
//  EventDetailView.swift
//  EventBrussels
//
//  Created by Harry on 05/07/2026.
//

import SwiftUI
import MapKit

struct EventDetailView: View {
    let event: EventModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(event.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(event.category.rawValue.capitalized)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(event.description)

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text(event.locationName)
                        .font(.headline)

                    NavigationLink {
                    
                    } label: {
                        Text(event.address)
                    }

                    Text(event.isFree ? "Free" : "€\(event.price, specifier: "%.2f")")
                        .fontWeight(.semibold)

                    Text(event.ageRestriction)
                }
            }
            .padding()
        }
        .navigationTitle(event.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EventDetailView(
            event: EventModel(
                id: UUID(),
                title: "Brussels Jazz Night",
                description: "Live jazz concert in Brussels.",
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
}
