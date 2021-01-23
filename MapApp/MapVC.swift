//
//  ViewController.swift
//  MapApp
//
//  Created by Anna Sibirtseva on 23/01/2021.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavBar()
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

