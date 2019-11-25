//
//  WeatherViewController.swift
//  WeatherMap
//
//  Created by Abdulla Aseed on 24/03/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import MapKit

class WeatherViewController: UIViewController , MKMapViewDelegate , WeatherDelegate  {
   
    
     var dataController: ControlData!
     var coordinate: CLLocationCoordinate2D!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var sunshineLabel: UILabel!
    @IBOutlet weak var cityCountryLable: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    var coordinater: CLLocationCoordinate2D!
   // var photos: [Photo]!
    var pin: Pin!
    var weather : Client!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.isZoomEnabled = false
        mapView.isScrollEnabled = false
        //////TODO: Weather Delegate
        weather = Client(deleGate: self)
        tempLabel.text = ""
         weather.getWeatherByCoor(lat: coordinate.latitude, lon: coordinate.longitude)
        print("latitude : \(coordinate.latitude)")
         print("longitude : \(coordinate.longitude)")
        //print(weather.getWeatherByCoor(lat: coordinate.latitude, lon: coordinate.longitude))
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        mapView.addAnnotation(annotation)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        self.mapView.setRegion(region, animated: true)
       
    }
    /////////////////////////////////////////////
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    func didGetWeather(weather: WeatherAPI) {
        DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
            DispatchQueue.main.sync {
                self.tempLabel.text = "\(Int(weather.tempCelsius))°"
                //ᵒᵒ°ᵒᵒ° ℃
                
                self.weatherImage.downloaded(from: "http://openweathermap.org/img/wn/\(weather.weatherIconID)@2x.png")
                
                self.descriptionLabel.text = "\(weather.weatherDescription)"

                self.cityCountryLable.text = "\(weather.city),\(weather.country)"
                
                
                var sunr : String = "\(weather.sunrise)"
                sunr.removeFirst(10)
                sunr.removeLast(5)
                self.sunshineLabel.text = "Sunrise  at   \(sunr)"
                
                var suns : String = "\(weather.sunset)"
                suns.removeFirst(10)
                suns.removeLast(5)
                self.sunsetLabel.text   = "Sunset   at   \(suns)"
              
                if weather.weatherIconID.last == "n"{
                    self.imageView.image = UIImage(named: "Night")
                    self.cityCountryLable.textColor = UIColor.white
                    self.sunsetLabel.textColor = UIColor.white
                    self.sunshineLabel.textColor = UIColor.white
                    self.descriptionLabel.textColor = UIColor.white
                }
                else {
                    self.imageView.image = UIImage(named: "Light")
                }

                
            }
            
        }
    }
    
    
    func didNotGetWeather(error: NSError) {
        DispatchQueue.global(qos: DispatchQoS.userInitiated.qosClass).async {
            DispatchQueue.main.sync {
                let alert = UIAlertController(title: "Can't get the weather", message: "The weather service isn't responding.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            print("didNotGetWeather error: \(error)")
        }
    }
    
    ///////////////////////////MARK :-
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {
            updates()
        }
    
}
}

extension WeatherViewController {
   
    //var url = URL(string: "http://openweathermap.org/img/wn/10d@2x.png")
    
}
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
