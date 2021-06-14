//
//  ViewController.swift
//  WeatherAppDemo
//
//  Created by neeraj joshi on 14/06/21.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var weatherImage:UIImageView!
    @IBOutlet weak var weather:UILabel!
    @IBOutlet weak var temp:UILabel!
    @IBOutlet weak var humidity:UILabel!
    var currentWeather:CurrentWeather!
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        determineMyCurrentLocation()
    }
    
    func updateLocationdata(){
        currentWeather = CurrentWeather(lat: (locationManager.location?.coordinate.latitude)! , lon: (locationManager.location?.coordinate.longitude)! )
        currentWeather.loadWeatherData {[weak self] weather in
            DispatchQueue.main.async {
            if let _weather = weather {
                switch _weather.current.weather[0].main {
                case "Haze":
                    self?.weatherImage.image = UIImage(named: "Haze")
                case "Clouds":
                    self?.weatherImage.image = UIImage(named: "Clouds")
                case "Rain":
                    self?.weatherImage.image = UIImage(named: "Rain")
                default:
                    self?.weatherImage.image = UIImage(named: "Weather")
                }
            }
            
            self?.weather.text = weather?.current.weather[0].main
            self?.temp.text = "\( Int((weather?.current.temp ?? 0) - 273.15))° Celcius"
            self?.humidity.text = "\(weather?.current.humidity ?? 0)%"
            }
        }
    }
  
}


extension ViewController:CLLocationManagerDelegate{
    
    func determineMyCurrentLocation() {
        
        
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locationManager.location?.coordinate != nil {
            updateLocationdata()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
}
