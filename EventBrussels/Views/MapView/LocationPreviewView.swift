//
//  LocationPreviewView.swift
//  EventBrussels
//
//  Created by Harry on 07/07/2026.
//

import SwiftUI

struct LocationPreviewView: View {
    let event: EventModel
    let nextButtonAction: () -> Void
    
    @State private var isShowingDetail = false
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack (spacing: 8){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial).offset(y: 65)
        ).cornerRadius(10)
        .navigationDestination(isPresented: $isShowingDetail) {
            EventDetailView(event: event)
        }
    }
}


extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            EventImageView(
                event: event,
                width: 100,
                height: 100,
                cornerRadius: 10,
                iconSize: 42.5
            )
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack (alignment: .leading, spacing: 4){
            Text(event.title).font(.title2).fontWeight(.bold)
            Text(event.locationName).font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            isShowingDetail = true
        } label: {
            Text("Details").font(.headline).frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            nextButtonAction()
        } label: {
            Text("Next").font(.headline).frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)

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
        ),
        nextButtonAction: {}
    ).padding()
}
