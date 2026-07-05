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
    
    private let eventService = EventService()
    
    init() {
        getEvents()
    }
    
    func getEvents() {
        events = eventService.loadEvents()
    }
}
