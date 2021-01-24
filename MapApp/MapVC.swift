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
    @IBOutlet weak var imagesCollectionView: UICollectionView!
   // @IBOutlet weak var toggleImagesButton: UIButton!
    @IBOutlet weak var cameraButton: UIButton!
    
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    
    let locationManager = CLLocationManager()
    var imagesHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization() 
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
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print("can't get location")
        }
        switch manager.accuracyAuthorization {
        case .reducedAccuracy:
            print("approximate location")
        case .fullAccuracy:
            print("getting exact location")
        @unknown default:
            print("this should not happen!")
        }
    }
    
    @IBAction func didTapToggleImage(_ sender: UIButton) {
        if imagesHidden == true {
            sender.setTitle("Hide Images", for: .normal)
            collectionViewBottomConstraint.constant = 0
            cameraButton.isUserInteractionEnabled = false
        } else {
            sender.setTitle("Show Images", for: .normal)
            collectionViewBottomConstraint.constant = -110
            cameraButton.isUserInteractionEnabled = true
           
        }
        
        UIView.animate(withDuration: 0.3) {
            self.cameraButton.alpha = self.imagesHidden ? 0 : 1
            self.imagesCollectionView.alpha = self.imagesHidden ? 1 : 0
            self.view.layoutIfNeeded()
        }
         
        imagesHidden = !imagesHidden
    }
    
    @IBAction func didTapCurrentLocation(_ sender: Any) {
    }
}

