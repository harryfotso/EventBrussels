//
//  Event.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import Foundation
import MapKit

struct EventModel: Codable, Identifiable {
    
    let id: UUID
    
    var title: String
    var description: String
    
    var category: EventCategory
    
    var startDate: Date
    var endDate: Date
    
    var locationName: String
    var address: String
    
    var latitude: Double
    var longitude: Double
    
    var isFree: Bool
    var price: Double
    
    var ageRestriction: String
    
    var imageURL: URL?
    var websiteURL: URL?
    
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
}



