//
//  ViewController.swift
//  maps
//
//  Created by Jaeson Booker on 3/16/17.
//  Copyright © 2017 Jaeson Booker. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        map.setRegion(region, animated: true)
        print (location.altitude)
        print (location.speed)
        
        self.map.showsUserLocation = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate =  self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//extension ViewController : CLLocationManagerDelegate {
//    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
//        if status == .AuthorizedWhenInUse {
//            locationManager.requestLocation()
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.first {
//            print("location:: (location)")
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
//        print("error:: (error)")
//    }
//}
