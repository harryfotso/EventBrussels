//
//  NoSavedEventView.swift
//  EventBrussels
//
//  Created by Harry on 07/07/2026.
//

import SwiftUI

struct NoSavedEventView: View {
    @Binding var selectedTab: AppTab
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
                .opacity(0.8)
                .offset(y: 3)
                .frame(width: 80, height: 80)
                .background(Color(red: 255 / 255, green: 236 / 255, blue: 237 / 255), in: Circle())
            Text("No saved events")
                .font(.headline)
            
            Text("Save events to find them here later.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .padding(.bottom)
            
         
            Button("Discover events") {
                selectedTab = .discover
            }
            .foregroundColor(.white)
            .font(Font.body.bold())
            .frame(width: 140, height: 30)
            .background(
                Color(.red),
                        in: RoundedRectangle(cornerRadius: 12)
            )
            
            
        }
        .multilineTextAlignment(.center)
        .padding()
        .navigationTitle("Your Events")
    }
}

#Preview {
    NoSavedEventView(selectedTab: .constant(.saved)).environmentObject(EventListViewModel())
}
