//
//  MapView.swift
//  EventBrussels
//
//  Created by Harry on 04/07/2026.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        let brusselsPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517),
                span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
            )
        )
        Map(initialPosition: brusselsPosition)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MapView()
}
