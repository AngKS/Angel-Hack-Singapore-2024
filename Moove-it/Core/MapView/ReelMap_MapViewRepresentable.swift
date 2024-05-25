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
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.showsUserTrackingButton = true
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("Debug: Map state is \(mapState).")
        
        switch mapState {
            case .noInput:
                context.coordinator.clearMapViewAndRecentreOnUserLocation()
                break
            case .searchingForLocation:
                break
            case .locationSelected:
                if let coordinate = locationViewModel.selectedLocationCoordinate {
                    context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                    context.coordinator.configurePolyLine(withDestinationCoordinate: coordinate)
                
                }
                break
        }

            
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
    
}


extension ReelMapViewRepresentable {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: - Properties
        let parent: ReelMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currRegion: MKCoordinateRegion?
        
        // MARK: - Lifecycle
        
        init(parent: ReelMapViewRepresentable){
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
            )
            
            self.currRegion = region
            
            parent.mapView.setRegion(region, animated: true)
            
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
//            Used to draw overlay
            let line = MKPolylineRenderer(overlay: overlay)
            line.strokeColor = .systemPurple
            line.lineWidth = 5
            
            return line
        }
        
        // MARK: Helpers
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
            
        }
        
        func configurePolyLine(withDestinationCoordinate coordinate: CLLocationCoordinate2D){
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
                    
            getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
                
            }
        }
        
        func getDestinationRoute(
            from userLocation: CLLocationCoordinate2D,
            to destinationCoordinate: CLLocationCoordinate2D,
            completion: @escaping(MKRoute) -> Void){
                let userPlaceMark = MKPlacemark(coordinate: userLocation)
                let destPlaceMark = MKPlacemark(coordinate: destinationCoordinate)
                let request = MKDirections.Request()
                request.source = MKMapItem(placemark: userPlaceMark)
                request.destination = MKMapItem(placemark: destPlaceMark)
                
                let directions = MKDirections(request: request)
                
                directions.calculate { response, error in
                    if let error = error {
                        print("Debug failed to get directions with error \(error.localizedDescription)")
                    }
                    
                    guard let route = response?.routes.first else { return }
                    completion(route)
                    
                }
            
        }
        func getPlacesOfInterests(){
            
            
            
        }
        
        func clearMapViewAndRecentreOnUserLocation(){
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currRegion = currRegion {
                parent.mapView.setRegion(currRegion, animated: true)
            }
        }
        
        
    }
}
 
