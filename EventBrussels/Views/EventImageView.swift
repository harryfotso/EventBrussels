//
//  EventImageView.swift
//  EventBrussels
//
//  Created by Harry on 07/07/2026.
//

import SwiftUI

struct EventImageView: View {
    let event: EventModel
    let width: CGFloat?
    let height: CGFloat
    let cornerRadius: CGFloat
    let iconSize: CGFloat
    
    init(
        event: EventModel,
        width: CGFloat? = nil,
        height: CGFloat,
        cornerRadius: CGFloat = 0,
        iconSize: CGFloat = 64
    ) {
        self.event = event
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
        self.iconSize = iconSize
    }
    
    var body: some View {
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
        .frame(width: width, height: height)
        .frame(maxWidth: width == nil ? .infinity : nil)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
        .clipped()
    }
    
    private var placeholderImage: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.75), .green.opacity(0.65)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            Image(systemName: event.category.systemImage)
                .font(.system(size: iconSize, weight: .bold))
                .foregroundStyle(.white.opacity(0.85))
        }
    }
}

#Preview {
    EventImageView(
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
        ),
        height: 250,
        cornerRadius: 24
    )
    .padding()
}
