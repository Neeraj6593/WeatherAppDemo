//
//  LocationManager.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import Foundation
import CoreLocation

class LocationManager:NSObject,CLLocationManagerDelegate{
    
    var locationCallback:((CLLocationManager)->())!
    func determineMyCurrentLocation() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if manager.location?.coordinate != nil {
           locationCallback(manager)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}
