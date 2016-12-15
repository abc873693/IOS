//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Mac mini 301 on 2016/12/15.
//  Copyright © 2016年 KUAS. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var Mapkits: MKMapView!
    var CompassOn = true
    var ScaleOn = true
    var TrafficOn = true
    var adress = ""
    let geoCoder = CLGeocoder()
    var locationMannager:CLLocationManager?
    var location:CLLocationCoordinate2D?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Mapkits.showsScale = true
        Mapkits.showsCompass = true
        Mapkits.showsTraffic = true

        Mapkits.delegate = self
        
        locationMannager = CLLocationManager()
        locationMannager?.delegate = self
        locationMannager?.requestWhenInUseAuthorization()
        locationMannager?.distanceFilter = CLLocationDistance(10)
        
        if Mapkits.userLocation.location != nil {
            location = Mapkits.userLocation.location!.coordinate
            Mapkits.setCenter(Mapkits.userLocation.location!.coordinate, animated: true)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationMannager?.startUpdatingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        locationMannager?.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let span = MKCoordinateSpanMake(0.05,0.05)
        let region = MKCoordinateRegion(center:location.coordinate,span:span)
        Mapkits.setRegion(region, animated: true)
        Mapkits.setCenter(location.coordinate, animated: true)
    }

    @IBAction func adress(_ sender: UITextField) {
        sender.resignFirstResponder()
        guard sender.text != "" else {
            return
        }
        adress = sender.text!
        geoCoder.geocodeAddressString(adress, completionHandler: {
            placemarks,error in
            guard placemarks != nil else{
                return
            }
            
            for placemark in placemarks!{
                let  annotation = MKPointAnnotation()
                annotation.title = "DB2"
                annotation.subtitle = "You are DB2"
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    self.Mapkits.showAnnotations([annotation], animated: true)
                    self.Mapkits.selectAnnotation(annotation,animated:true)
                }
            }
        })
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Locpin"
        if annotation is MKUserLocation{
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView?.canShowCallout = true
        
        let pinImageView = UIImageView(frame: CGRect(x:0,y:0,width:50,height:50))
        pinImageView.image = UIImage(named:"001")
        annotationView?.leftCalloutAccessoryView = pinImageView
        return annotationView
    }

    @IBAction func show_Compass(_ sender: UISwitch) {
        if sender.isOn {
            Mapkits.showsCompass = true
        }
        else {
            Mapkits.showsCompass = false
        }
        
    }

    @IBAction func show_Scale(_ sender: UISwitch) {
        if sender.isOn {
            Mapkits.showsScale = true
        }
        else {
            Mapkits.showsScale = false
        }
    }
    
    @IBAction func show_Traffic(_ sender: UISwitch) {
        if sender.isOn {
            Mapkits.showsTraffic = true
        }
        else {
            Mapkits.showsTraffic = false
        }
    }
    @IBAction func SegmentChange(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
            Mapkits.mapType = MKMapType.standard
            break
        case 1:
            Mapkits.mapType = MKMapType.satellite
            break
        default:
            Mapkits.mapType = MKMapType.hybrid
            break
        }
        
    }
}

