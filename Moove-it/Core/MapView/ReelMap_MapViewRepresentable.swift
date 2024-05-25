//
//  MapViewRepresentable.swift
//  Moove-it
//
//  Created by Ang KS on 25/5/24.
//

import Foundation
import SwiftUI
import MapKit


struct ReelMapViewRepresentable: UIViewRepresentable {

    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedLocation = locationViewModel.selectedLocation {
            print("Debug selected location in mapView is \(selectedLocation)")
        }
            
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}


extension ReelMapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: ReelMapViewRepresentable
        
        init(parent: ReelMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
            )
            
            parent.mapView.setRegion(region, animated: true)
            
            
        }
    }
}
