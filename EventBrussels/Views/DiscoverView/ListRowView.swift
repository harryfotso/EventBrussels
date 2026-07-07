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
    
    private var isSaved: Bool {
        eventListViewModel.isSaved(event)
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            NavigationLink(destination: EventDetailView(event: event)) {
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
    }
    
    private var imageHeader: some View {
        ZStack(alignment: .bottomLeading) {
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
            .frame(height: 250)
            .frame(maxWidth: .infinity)
            .clipped()
            
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
                .font(.title3.weight(.semibold))
                .foregroundStyle(.primary)
            
            Spacer()
            
            Text(priceText)
                .font(.title3.bold())
                .foregroundStyle(.white)
                .padding(.horizontal, 22)
                .frame(height: 54)
                .background(.black, in: Capsule())
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
    }
    
    private var categoryBadge: some View {
        Label(event.category.displayName, systemImage: event.category.systemImage)
            .font(.headline.bold())
            .foregroundStyle(.white)
            .padding(.horizontal, 16)
            .frame(height: 44)
            .background(.green, in: Capsule())
    }
    
    private var saveButton: some View {
        Button {
            eventListViewModel.toggleSaved(event)
        } label: {
            Image(systemName: isSaved ? "heart.fill" : "heart")
                .font(.title2.bold())
                .foregroundStyle(.white)
                .frame(width: 58, height: 58)
                .background(.black.opacity(0.35), in: Circle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(isSaved ? "Remove from saved" : "Add to saved")
    }
    
    private var placeholderImage: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.75), .green.opacity(0.65)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(systemName: event.category.systemImage)
                .font(.system(size: 64, weight: .bold))
                .foregroundStyle(.white.opacity(0.85))
        }
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

private extension EventCategory {
    var displayName: String {
        switch self {
        case .sport: return "Sports"
        case .culture: return "Culture"
        case .concert: return "Concert"
        case .nightlife: return "Nightlife"
        case .conference: return "Conference"
        case .kids: return "Kids"
        case .student: return "Student"
        case .family: return "Family"
        case .festival: return "Festival"
        case .art: return "Art"
        case .workshop: return "Workshop"
        case .food: return "Food"
        case .charity: return "Charity"
        case .education: return "Education"
        case .game: return "Game"
        case .other: return "Other"
        }
    }
    
    var systemImage: String {
        switch self {
        case .sport: return "soccerball"
        case .culture: return "theatermasks.fill"
        case .concert: return "music.mic"
        case .nightlife: return "moon.stars.fill"
        case .conference: return "person.3.fill"
        case .kids: return "figure.and.child.holdinghands"
        case .student: return "graduationcap.fill"
        case .family: return "house.fill"
        case .festival: return "sparkles"
        case .art: return "paintpalette.fill"
        case .workshop: return "hammer.fill"
        case .food: return "fork.knife"
        case .charity: return "heart.circle.fill"
        case .education: return "book.fill"
        case .game: return "gamecontroller.fill"
        case .other: return "star.fill"
        }
    }
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
