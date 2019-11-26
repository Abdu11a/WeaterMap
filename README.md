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
 
 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen2.png" width=400>
 
 
 
 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen3.png" width=400>
 
 **After the user selects a pin , the Weather View should Download and Desplay :**
 
|  View desplay             | Type           | Description |   
| ---                       | ---            | ---
| temperature               | UILabel        |
| City and Country name     | UILabel        |
| Weather Description       | UILabel        |
| sunset and sunrise time   |  UILabel       |
|    Weather icon           | UIImageView    |
|    Map View               | MKMapView      |
|  Image View               | UIImageView    |  


 <img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen4.png" width=400>
 ---

## Runing the WeatherMap App :

To run this app you need to [Downlaod the WeatherMap](https://github.com/Abdu11a/WeaterMap/archive/master.zip), and open

```
coooooood
```
<img src="https://github.com/Abdu11a/WeaterMap/blob/master/Image/screen6.png" width=600>
### The app Issues :

---

## Requirements to run this app

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
