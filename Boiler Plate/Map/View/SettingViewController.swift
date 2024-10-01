//
//  SettingViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit
import MapKit

class SettingViewController: UIViewController {

    let mapView = MKMapView()
    var locationManager = CLLocationManager() // Create an instance of CLLocationManager
    var destinationLocation: CLLocationCoordinate2D? // To store the destination location
    var currentRoute: MKPolyline? // To store the current route overlay

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        self.title = "Setting"
        
        setupMapView()
        setupLocationManager()
    }

    private func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // Fill the entire view
        ])
        
        // Set delegate for handling user interactions
        mapView.delegate = self
        
        // Enable user location on the map
        mapView.showsUserLocation = true
        
        // Add a tap gesture recognizer to the map
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapTapped(_:)))
        mapView.addGestureRecognizer(tapGesture)
    }

    private func setupLocationManager() {
        // Check for location permission and request it if necessary
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation() // Start updating location here
    }

    // Function to add directions to the selected location
    private func addDirections(to location: CLLocationCoordinate2D) {
        guard let userLocation = mapView.userLocation.location?.coordinate else { return }

        let sourcePlacemark = MKPlacemark(coordinate: userLocation)
        let destinationPlacemark = MKPlacemark(coordinate: location)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let request = MKDirections.Request()
        request.source = sourceMapItem
        request.destination = destinationMapItem
        request.transportType = .automobile // Change to .walking or .transit if needed

        let directions = MKDirections(request: request)
        directions.calculate { (response, error) in
            guard let response = response else {
                if let error = error {
                    print("Error getting directions: \(error.localizedDescription)")
                }
                return
            }
            // Get the first route and add it to the map
            if let route = response.routes.first {
                // Remove the previous route if it exists
                if let currentRoute = self.currentRoute {
                    self.mapView.removeOverlay(currentRoute)
                }
                self.currentRoute = route.polyline // Update the current route
                self.mapView.addOverlay(route.polyline, level: .aboveRoads)
                
                // Set the visible map rect based on the polyline's bounding map rect
                let mapRect = route.polyline.boundingMapRect
                self.mapView.setVisibleMapRect(mapRect, animated: true)
            }
        }
    }

    @objc private func mapTapped(_ gesture: UITapGestureRecognizer) {
        let locationInView = gesture.location(in: mapView)
        let coordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)

        // Mark the selected location with an annotation
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Selected Location"
        annotation.subtitle = "Tap to delete"
        mapView.addAnnotation(annotation)

        // Add directions to the selected coordinate
        addDirections(to: coordinate)
    }
}

// MARK: - MKMapViewDelegate
extension SettingViewController: MKMapViewDelegate {
    // Render the route overlay
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polylineOverlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polylineOverlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
        return MKOverlayRenderer()
    }
    
    // Customize the annotation view with a callout accessory
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier = "LocationPin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            // Add a delete button to the callout
            let deleteButton = UIButton(type: .system)
            deleteButton.setTitle("Delete", for: .normal)
            deleteButton.addTarget(self, action: #selector(deleteAnnotation(_:)), for: .touchUpInside)
            annotationView?.rightCalloutAccessoryView = deleteButton
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    // Handle tap on callout accessory to delete annotation
    @objc private func deleteAnnotation(_ sender: UIButton) {
        // Locate the annotation to delete
        guard let annotationView = mapView.selectedAnnotations.first else { return }
        
        // Remove the annotation from the map
        mapView.removeAnnotation(annotationView)
    }
}

// MARK: - CLLocationManagerDelegate
extension SettingViewController: CLLocationManagerDelegate {
    // Optional: Handle authorization status changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation() // Start updating location after authorization
        }
    }

    // Update user's location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            // Optionally, center the map on the user's location
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        }
    }
}
