//
//  LocationSearchViewModel.swift
//  Moove-it
//
//  Created by Ang KS on 25/5/24.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject{
    
    // MARK: properties
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet {
//            print("Debug queryFragment is: \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
            
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
        
    }
    
    // MARK: helpers
    func selectLocation(_ localSearch: MKLocalSearchCompletion){
        
        // Search for location to generate the data
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("Debug location search failed with error \(error.localizedDescription)")
                return
            }
            
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedLocationCoordinate = coordinate
            print("Debug Location coordinates: \(coordinate)")
            
            
        }
        
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler){
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler: completion)
    }
    
}

// MARK: MKLocalSearchCompleterDelegate
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
