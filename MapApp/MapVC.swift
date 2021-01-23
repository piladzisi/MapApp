//
//  ViewController.swift
//  MapApp
//
//  Created by Anna Sibirtseva on 23/01/2021.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.userTrackingMode = .follow
        
    }

    private func customizeNavBar() {
        let green = UIColor(hexString: "009051")
        navigationController?.navigationBar.prefersLargeTitles = true
       // navigationController?.navigationBar.barTintColor  = green // for small titles
        navigationController?.view.backgroundColor = green // for large titles
    }
    
    @IBAction func didTapCameraButton(_ sender: UIButton) {
        print("tap camera")
    }
}

