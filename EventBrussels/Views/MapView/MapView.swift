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
    
    var body: some View {
        let brusselsPosition = MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517),
                span: MKCoordinateSpan(latitudeDelta: 0.06, longitudeDelta: 0.06)
            )
        )
        
        ZStack {
            Map(initialPosition: brusselsPosition)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    ForEach(vm.events) { event in
                        LocationPreviewView(event: event)
                            .shadow(color: Color.black.opacity(0.1), radius: 20)
                            .padding().transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                    }
                }
            }
        }
    }
}

#Preview {
    MapView().environmentObject(EventListViewModel())
}
