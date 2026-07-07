//
//  ListRowView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI

struct ListRowView: View {
    
    let event: EventModel
    
    @EnvironmentObject private var eventListViewModel: EventListViewModel
    @State private var isShowingDetail = false
    
    private var isSaved: Bool {
        eventListViewModel.isSaved(event)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button {
                isShowingDetail = true
            } label: {
                VStack(spacing: 0) {
                    imageHeader
                    bottomInfo
                }
                .background(.background)
                .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                .shadow(color: .black.opacity(0.10), radius: 14, x: 0, y: 8)
            }
            .buttonStyle(.plain)
            
            saveButton
                .padding(20)
        }
        .padding(.vertical, 8)
        .navigationDestination(isPresented: $isShowingDetail) {
            EventDetailView(event: event)
        }
    }
    
    private var imageHeader: some View {
        ZStack(alignment: .bottomLeading) {
            EventImageView(event: event, height: 250, iconSize: 64)
            
            LinearGradient(
                colors: [.clear, .black.opacity(0.68)],
                startPoint: .center,
                endPoint: .bottom
            )
            
            VStack(alignment: .leading, spacing: 10) {
                categoryBadge
                Spacer()
                Text(event.title)
                    .font(.title.bold())
                    .foregroundStyle(.white)
                    .lineLimit(2)
                
                Label(event.locationName, systemImage: "mappin.circle.fill")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .lineLimit(1)
            }
            .padding(22)
        }
        .frame(height: 250)
    }
    
    private var bottomInfo: some View {
        HStack {
            Label(formattedDate, systemImage: "calendar")
                .font(.title3)
                .foregroundStyle(.primary)
            
            Spacer()
            
            Text(priceText)
                .font(.title3.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
                .frame(height: 34)
                .background(.black, in: Capsule())
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
    }
    
    private var categoryBadge: some View {
        Label(event.category.displayName, systemImage: event.category.systemImage)
            .font(.headline.bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 25)
            .frame(height: 40)
            .background(.green, in: Capsule())
    }
    
    private var saveButton: some View {
        Button {
            eventListViewModel.toggleSaved(event)
        } label: {
            Image(systemName: isSaved ? "heart.fill" : "heart")
                .font(.title2.bold())
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(.black.opacity(0.35), in: Circle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isSaved ? "Remove from saved" : "Add to saved")
    }
    
    private var formattedDate: String {
        Self.dateFormatter.string(from: event.startDate)
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
        ListRowView(
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
        .environmentObject(EventListViewModel())
        .padding()
    }
}
