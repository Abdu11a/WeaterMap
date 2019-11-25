//
//  WeatherAPI.swift
//  WeatherMap
//
//  Created by Abdulla Aseed on 26/03/1441 AH.
//  Copyright © 1441 Abdulla Alsahli. All rights reserved.
//

import Foundation

struct WeatherAPI {
    
    let dateAndTime: NSDate
    
    let city: String
    let country: String
    let longitude: Double
    let latitude: Double
    
    let weatherID: Int
    let mainWeather: String
    let weatherDescription: String
    let weatherIconID: String
    
  
    
    private let temp: Double
    
    var tempCelsius: Double {
        get {
            return temp - 273.15
        }
    }
    
    var tempFahrenheit: Double {
        get {
            return (temp - 273.15) * 1.8 + 32
        }
    }
    
    let humidity: Int
    let pressure: Int
    let cloudCover: Int
    let windSpeed: Double
    
    let windDirection: Double?
    let rainfallInLast3Hours: Double?
    
    let sunrise: NSDate
    let sunset: NSDate
    
    init(weatherData: [String: AnyObject]) {
        
        dateAndTime = NSDate(timeIntervalSince1970: weatherData["dt"] as! TimeInterval)
        city = weatherData["name"] as! String
        
        let coordDict = weatherData["coord"] as! [String: AnyObject]
        longitude = coordDict["lon"] as! Double
        latitude = coordDict["lat"] as! Double
        
        let weatherDict = weatherData["weather"]![0] as! [String: AnyObject]
        weatherID = weatherDict["id"] as! Int
        mainWeather = weatherDict["main"] as! String
        weatherDescription = weatherDict["description"] as! String
        weatherIconID = weatherDict["icon"] as! String
        
        let mainDict = weatherData["main"] as! [String: AnyObject]
        temp = mainDict["temp"] as! Double
        humidity = mainDict["humidity"] as! Int
        pressure = Int(mainDict["pressure"] as! Double);Int()
        
        cloudCover = weatherData["clouds"]!["all"] as! Int
        
        let windDict = weatherData["wind"] as! [String: AnyObject]
        windSpeed = windDict["speed"] as! Double
        windDirection = windDict["deg"] as? Double
        
        if weatherData["rain"] != nil {
            let rainDict = weatherData["rain"] as! [String: AnyObject]
            rainfallInLast3Hours = rainDict["3h"] as? Double
        }
        else {
            rainfallInLast3Hours = nil
        }
        
        let sysDict = weatherData["sys"] as! [String: AnyObject]
        country = sysDict["country"] as! String 
        sunrise = NSDate(timeIntervalSince1970: sysDict["sunrise"] as! TimeInterval)
        sunset = NSDate(timeIntervalSince1970:sysDict["sunset"] as! TimeInterval)
    }
    
}
//{"coord":{"lon":139.01,"lat":35.02}
//    ,"weather":[{"id":800,"main":"Clear","description":"clear sky","icon":"01n"}]
//    ,"base":"stations","main":{"temp":285.514,"pressure":1013.75,"humidity":100,"temp_min":285.514,"temp_max":285.514,"sea_level":1023.22,"grnd_level":1013.75},"wind":{"speed":5.52,"deg":311},"clouds":{"all":0},"dt":1485792967,"sys":{"message":0.0025,"country":"JP","sunrise":1485726240,"sunset":1485763863},"id":1907296,"name":"Tawarano","cod":200}
