//
//  MapView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @EnvironmentObject private var vm: EventListViewModel
    @State private var brusselsPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517),
            span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
        )
    )
    @State private var selectedEventID: UUID?
    
    var body: some View {
        ZStack {
            eventMap
            previewStack
        }
        .onAppear {
            selectInitialEventIfNeeded()
        }
    }
    
    private var eventMap: some View {
        Map(position: $brusselsPosition) {
            ForEach(vm.events) { event in
                Annotation(event.title, coordinate: event.coordinate, anchor: .bottom) {
                    AnnotationView()
                        .scaleEffect(selectedEventID == event.id ? 1 : 0.7)
                        .shadow(radius: selectedEventID == event.id ? 10 : 4)
                        .onTapGesture {
                            selectEvent(event)
                        }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    private var previewStack: some View {
        VStack {
            Spacer()
            
            if let selectedEvent {
                LocationPreviewView(event: selectedEvent, nextButtonAction: selectNextEvent)
                    .shadow(color: Color.black.opacity(0.1), radius: 20)
                    .padding()
                    .transition(previewTransition)
                    .id(selectedEvent.id)
            }
        }
    }
    
    private var previewTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
    
    private var selectedEvent: EventModel? {
        guard let selectedEventID else {
            return vm.events.first
        }
        
        return vm.events.first { $0.id == selectedEventID }
    }
    
    private func selectInitialEventIfNeeded() {
        guard selectedEventID == nil, let firstEvent = vm.events.first else {
            return
        }
        
        selectedEventID = firstEvent.id
    }
    
    private func selectNextEvent() {
        guard !vm.events.isEmpty else {
            return
        }
        
        let currentIndex = selectedEventID.flatMap { selectedEventID in
            vm.events.firstIndex { $0.id == selectedEventID }
        } ?? 0
        let nextIndex = (currentIndex + 1) % vm.events.count
        
        selectEvent(vm.events[nextIndex])
    }
    
    private func selectEvent(_ event: EventModel) {
        selectedEventID = event.id
        
        withAnimation(.easeInOut) {
            brusselsPosition = .region(
                MKCoordinateRegion(
                    center: event.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
                )
            )
        }
    }
}

#Preview {
    MapView().environmentObject(EventListViewModel())
}
