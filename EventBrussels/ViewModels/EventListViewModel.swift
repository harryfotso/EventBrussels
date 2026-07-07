//
//  EventListViewModel.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import Foundation
import SwiftUI
import Combine


class EventListViewModel: ObservableObject {
    
    @Published var events: [EventModel] = []
    @Published public var savedEventIDs: Set<UUID> = []
    
    private let eventService = EventService()
    
    init() {
        getEvents()
    }
    
    func getEvents() {
        events = eventService.loadEvents()
    }
    
    func isSaved(_ event: EventModel) -> Bool {
        savedEventIDs.contains(event.id)
    }
    
    func toggleSaved(_ event: EventModel) {
        if savedEventIDs.contains(event.id) {
            savedEventIDs.remove(event.id)
        } else {
            savedEventIDs.insert(event.id)
        }
    }
}
