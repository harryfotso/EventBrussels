//
//  EventCategory.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import Foundation

enum EventCategory: String, Codable {
    case sport
    case culture
    case concert
    case nightlife
    case conference
    case kids
    case student
    case family
    case festival
    case art
    case workshop
    case food
    case charity
    case education
    case game
    case other
}
extension EventCategory {
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
        case .sport: return "figure.run"
        case .culture: return "theatermasks.fill"
        case .concert: return "music.mic"
        case .nightlife: return "moon.stars.fill"
        case .conference: return "person.3.fill"
        case .kids: return "figure.and.child.holdinghands"
        case .student: return "graduationcap.fill"
        case .family: return "figure.2.and.child.holdinghands"
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

