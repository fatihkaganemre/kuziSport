//
//  InfoViewMapHelper.swift
//  Karate
//
//  Created by fatih on 06/06/2019.
//  Copyright © 2019 Fatih Kagan Emre. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

struct MapViewHelper {
    func mapView(title: String, coordinate: CLLocationCoordinate2D) -> MKMapView {
        let mapView = MKMapView()
        let regionRadius: CLLocationDistance = 1500
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        let annotation = PropertyAnnotation(title: title, coordinate: coordinate)
        mapView.setRegion(region, animated: false)
        mapView.addAnnotation(annotation)

        return mapView
    }
}

// TO DO: Make MapViewHelper more testable , cosider to subclass MKMapView or create a dependency

fileprivate class PropertyAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
