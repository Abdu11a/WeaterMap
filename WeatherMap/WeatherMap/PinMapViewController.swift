//
//  PinMapViewController.swift
//  WeatherMap
//
//  Created by Abdulla Aseed on 24/03/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreData
class PinMapViewController: UIViewController , MKMapViewDelegate , UIGestureRecognizerDelegate {
    
    var dataController : ControlData!
    @IBOutlet weak var mapView: MKMapView!
    var pins: [Pin] = []
    override func viewWillAppear(_ animated: Bool) {
        addpin()
        view.reloadInputViews()
        
        self.navigationController?.navigationBar.tintColor = UIColorFromRGB(colorCode: "4A9AA0", alpha: 1.0)
       
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(tappedToAddPin))
        gesture.delegate = self
        mapView.addGestureRecognizer(gesture)
        
        let fetshRequest : NSFetchRequest<Pin> = Pin.fetchRequest()
        if let result = try? dataController.viewContext.fetch(fetshRequest){
            pins = result
            mapView.removeAnnotations(mapView.annotations)
            addpin()
        }
        
    }
    
   
    
    @objc func tappedToAddPin(gestureReconizer : UIGestureRecognizer){
        if gestureReconizer.state == UIGestureRecognizer.State.began {
            let location = gestureReconizer.location(in: mapView)
            let coordinate = mapView.convert(location, toCoordinateFrom : mapView)
            
            let pin = Pin(context: dataController.viewContext)
            pin.lat = coordinate.latitude.magnitude
            pin.lon = coordinate.longitude.magnitude
            do{
                try dataController.viewContext.save()
                
            }catch{
                print(error.localizedDescription)
            }
            pins.append(pin)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
        }
        
    }
    
    
    func addpin() {
        mapView.removeAnnotations(mapView.annotations)
        var annotations = [MKPointAnnotation]()
        for pin in pins {
            let coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(pin.lat), longitude:  CLLocationDegrees(pin.lon))
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
    
    func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor{
        let scanner = Scanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}
