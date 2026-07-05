//
//  EventService.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import Foundation
import UIKit

class EventService {
     
    func loadEvents() -> [EventModel] {
        guard let sourcesURL = Bundle.main.url(
            forResource: "sample_events",
            withExtension: "json")
        else {
            fatalError("Could not find sample_events.json file.")
        }
        
        guard let eventData = try? Data(contentsOf: sourcesURL) else {
            fatalError("Could not load sample_events.json file.")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        guard let events = try? decoder.decode([EventModel].self, from: eventData) else {
            fatalError("Could not decode sample_events.json file.")
        }
        
        return events
    }
}
