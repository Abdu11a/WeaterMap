//
//  MapExtension.swift
//  WeatherMap
//
//  Created by Abdulla Aseed on 24/03/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import MapKit
import CoreData

extension PinMapViewController  {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.pinTintColor = .red
            pinView!.canShowCallout = false
            pinView?.animatesDrop = true
        } else {pinView?.annotation = annotation }
        return pinView
    }
    
    ///////////////////////////////////////////////////////////TODO:SELCET THE MAP PIN-
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        guard let annotation =  view.annotation else {
            return
        }
        mapView.deselectAnnotation(annotation, animated: true)
        let latitude = (annotation.coordinate.latitude)
        let longitude = (annotation.coordinate.longitude)
        
        print(latitude)
        print(longitude)
       
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "WeatherView") as? WeatherViewController
       controller?.coordinate = view.annotation?.coordinate
        for pin in pins {
            if pin.lat.isEqual(to: view.annotation?.coordinate.longitude.magnitude ?? 90){
                controller?.pin = pin
            }
        }
        controller?.dataController = dataController
        self.show(controller!, sender: nil)
        
    }
    
}


extension WeatherViewController {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.pinTintColor = .red
            pinView!.canShowCallout = false
            pinView?.animatesDrop = true
        } else {pinView!.annotation = annotation }
        
        return pinView
    }
}

