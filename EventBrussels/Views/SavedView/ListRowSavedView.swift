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
        HStack(spacing: 16) {
            thumbnail
            eventInfo
            Spacer(minLength: 8)
            chevron
        }
        .padding(14)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
        .shadow(color: .black.opacity(0.08), radius: 12, x: 0, y: 6)
    }
    
    private var thumbnail: some View {
        AsyncImage(url: event.imageURL) { phase in
            switch phase {
            case .empty:
                placeholderImage
                    .overlay {
                        ProgressView()
                            .tint(.white)
                    }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                placeholderImage
            @unknown default:
                placeholderImage
            }
        }
        .frame(width: 128, height: 128)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
    }
    
    private var eventInfo: some View {
        VStack(alignment: .leading, spacing: 6) {
            Circle()
                .fill(.green)
                .frame(width: 14, height: 14)
            
            Text(event.title)
                .font(.title2.bold())
                .foregroundStyle(.primary)
                .lineLimit(1)
            
            Text(formattedDateLocation)
                .font(.title3)
                .foregroundStyle(.secondary)
                .lineLimit(1)
            
            Text(priceText)
                .font(.title3.bold())
                .foregroundStyle(.red.opacity(0.8))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var chevron: some View {
        Image(systemName: "chevron.right")
            .font(.title.bold())
            .foregroundStyle(.secondary)
    }
    
    private var placeholderImage: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.75), .green.opacity(0.65)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(systemName: event.category.systemImage)
                .font(.system(size: 44, weight: .bold))
                .foregroundStyle(.white.opacity(0.85))
        }
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
