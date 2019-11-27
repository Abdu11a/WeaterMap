#               WeatherMap
[Udacity's Final project](https://www.udacity.com)

![weather Icon](https://github.com/Abdu11a/WeaterMap/blob/master/WeatherMap/WeatherMap/Assets.xcassets/AppIcon.appiconset/Icon-App-83.5x83.5%402x.png)
## Overview
This app allows users to specify locations around the world, and to see the weather information location. The locations will be stored in Core Data.
The WeatherMap app downloads the weather informations and weather icons from [openweathermap](https://openweathermap.org/api). The app allows users to drop pins on a map . Users will then be able to desplay he weather informations and weather icons for the location association of the weather informations and weather icons with the pin.

---
## the app have tow view controller :
- **Add Pin View**  :  Allows the user to drop pins around the world in the map view .

 When the app first starts it will open to Add Pin View (map view). Users will be able to zoom and scroll around the map using standard pinch and drag gestures. The center of the map and the zoom level should be persistent. If the app is turned off, the map should return to the same state when it is turned on again. Tapping and holding the map drops a new pin. 

<img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/Screen1.png" width=400>

Users can place any number of pins on the map. When a pin is tapped, the app will navigate to the Weather View associated with the pin.



---

- **Weather View** : Allows the users to see the weather information  

If you taps the pin , The app Will Download the weather information from [openweathermap](https://openweathermap.org)associated with location by using latitude and longitude of the pin .
If the user selects a pin that already exist the Weather View should Download the weather information again to display the weather information in the Weather View .
 
 
- Weather View in light 
 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen2.png" width=400>
 
 
 
 
 Weather View in night
 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen3.png" width=400>
 
 ---
 
 **After the user selects a pin , the Weather View should Download and Display :**
 
|  View Display             | Type           | Description |   
| ---                       | ---            | ---
| temperature               | UILabel        | get temperature from openweathermap API , JSON returns data by the geographic coordinates , lat and lon coordinates of the location of your interest . 
| City and Country name     | UILabel        |get City and Country name from openweathermap API , JSON returns data by the geographic coordinates , lat and lon coordinates of the location of your interest .
| Weather Description       | UILabel        | get Weather Description from openweathermap API , JSON returns data by the geographic coordinates , lat and lon coordinates of the location of your interest .
| sunset and sunrise time   |  UILabel       |  get sunset and sunrise time from openweathermap API , JSON returns data by the geographic coordinates , lat and lon coordinates of the location of your interest .
|    Weather icon           | UIImageView    | we get image icon by using imageiconID parameter .and download the image icon from URL by using this func .
```
downloaded(from: "http://openweathermap.org/img/wn/\(weather.weatherIconID)@2x.png") 

```
|  View Display             | Type           | Description |   
| ---                       | ---            | ---
|    Map View               | MKMapView      | the Weather View dispaly map view and pin of your selcted location .
|  Image View               | UIImageView    | this image is background for weather information view . the image change when the current time is night or light.




### Example of API call:  
we use this url and lan , lon and openWeatherIPkey Parameters to get data

```
      private let openWeatherURL = "https://api.openweathermap.org/data/2.5/weather"
      private let openWeatherIPkey = "******************************" 
    // sign in [openweathermap](https://openweathermap.org/api) to get your apiKey
    
    func getWeatherByCoor(lat : Double , lon : Double) {
        
        let weatherRequestURL = URL(string: "\(openWeatherURL)?lat=\(lat)&lon=\(lon)&appid=\(openWeatherIPkey)")!
                                                         }
```

### JSON Example of API response 
```
{"coord": { "lon": 139,"lat": 35},
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01n"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 289.92,
    "pressure": 1009,
    "humidity": 92,
    "temp_min": 288.71,
    "temp_max": 290.93
  },
  "wind": {
    "speed": 0.47,
    "deg": 107.538
  },
  "clouds": {
    "all": 2
  },
  "dt": 1560350192,
  "sys": {
    "type": 3,
    "id": 2019346,
    "message": 0.0065,
    "country": "JP",
    "sunrise": 1560281377,
    "sunset": 1560333478
  },
  "timezone": 32400,
  "id": 1851632,
  "name": "Shuzenji",
  "cod": 200
}
```

#### Alert Action, when some Network connection issues happen .
 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen4.png" width=400>
 
 ---

 ---

## Requirements to run this app

**To run this app you need to [Downlaod the WeatherMap](https://github.com/Abdu11a/WeaterMap/archive/master.zip).**

### Versions:

- [![Xcode Version](https://img.shields.io/badge/Xcode-10+-success.svg)](https://swift.org) 
- [![Swift Version](https://img.shields.io/badge/Swift-4+-success.svg)](https://swift.org)
- [![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](https://swift.org)

### [openweathermap API : ](https://openweathermap.org/api)

**This app uses the openweathermap API to get :**
- City geo location,coordinate latitude and longitude.
- City nam and Country code.
- Weather Description.
- sunset and sunrise time.
- temperature in Dgree.
- Weather icon for despalay icon in **Weather View**. 
- In Info.plist you need to add App Transport Security Settings Key to Allow Arbitrary Loads.

<img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen6.png" width=600>
