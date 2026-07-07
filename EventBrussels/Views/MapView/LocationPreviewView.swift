//
//  LocationPreviewView.swift
//  EventBrussels
//
//  Created by Harry on 07/07/2026.
//

import SwiftUI

struct LocationPreviewView: View {
    let event: EventModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            EventImageView(
                event: event,
                height: 120,
                cornerRadius: 16,
                iconSize: 42
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(event.locationName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(12)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: .black.opacity(0.12), radius: 12, x: 0, y: 6)
        .padding()
    }
}

#Preview {
    LocationPreviewView(
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
