//
//  ListRowSavedView.swift
//  EventBrussels
//
//  Created by Harry on 06/07/2026.
//

import SwiftUI

struct ListRowSavedView: View {
    let event: EventModel
    
    @State private var isShowingDetail = false
    
    var body: some View {
        Button {
            isShowingDetail = true
        } label: {
            rowContent
        }
        .buttonStyle(.plain)
        .navigationDestination(isPresented: $isShowingDetail) {
            EventDetailView(event: event)
        }
    }
    
    private var rowContent: some View {
        HStack(spacing: 12) {
            thumbnail
            eventInfo
            Spacer(minLength: 6)
            chevron
        }
        .padding(10)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 10, x: 0, y: 5)
    }
    
    private var thumbnail: some View {
        EventImageView(
            event: event,
            width: 80,
            height: 80,
            cornerRadius: 12,
            iconSize: 34
        )
    }
    
    private var eventInfo: some View {
        VStack(alignment: .leading, spacing: 4) {
            Circle()
                .fill(.green)
                .frame(width: 12, height: 12)
            
            Text(event.title)
                .font(.headline.bold())
                .foregroundStyle(.primary)
                .lineLimit(1)
            
            Text(formattedDateLocation)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineLimit(1)
            
            Text(priceText)
                .font(.headline.bold())
                .foregroundStyle(.red.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chevron: some View {
        Image(systemName: "chevron.right")
            .font(.title2.bold())
            .foregroundStyle(.secondary)
    }
    
    private var formattedDateLocation: String {
        "\(Self.dateFormatter.string(from: event.startDate)) · \(event.locationName)"
    }
    
    private var priceText: String {
        event.isFree ? "Free" : "€\(Int(event.price))"
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E d MMM · HH:mm"
        return formatter
    }()
}

#Preview {
    NavigationStack {
        ListRowSavedView(
            event: EventModel(
                id: UUID(),
                title: "Bouldering Meetup",
                description: "A climbing session for beginners and experienced boulderers.",
                category: .sport,
                startDate: Date(),
                endDate: Date(),
                locationName: "Bleau Boulder Hall",
                address: "Brussels",
                latitude: 50.8276,
                longitude: 4.3723,
                isFree: false,
                price: 10.0,
                ageRestriction: "All ages",
                imageURL: nil,
                websiteURL: nil
            )
        )
        .padding()
    }
}
