//
//  ViewController.swift
//  MapSample
//
//  Created by 鈴木瑛二 on 2017/04/23.
//  Copyright © 2017年 jp.co.edu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var positionLabel: UILabel!
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        // 縮尺を設定
        var region = mapView.region
        region.center = Landmarks.imperialPalace.point
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        mapView.setRegion(region, animated:true)
        
        // 表示タイプを航空写真と地図のハイブリッドに設定
        mapView.mapType = MKMapType.standard
        
        // pin
        let annotation = MKPointAnnotation()
        annotation.coordinate = Landmarks.nearTokyoStation.point
        annotation.title = "鈴木 瑛二"
        mapView.addAnnotation(annotation)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = Landmarks.tokyoStation.point
        annotation2.title = "ユーザ2"
        mapView.addAnnotation(annotation2)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: map delegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circleRenderer = MKCircleRenderer(overlay: overlay);
        circleRenderer.strokeColor = UIColor.red
        circleRenderer.fillColor = UIColor(red: 0.0, green: 0.0, blue: 0.7, alpha: 0.5)
        circleRenderer.lineWidth = 1.0
        return circleRenderer
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
        }
        
        pinView!.annotation = annotation
        pinView!.animatesDrop = true
        pinView!.canShowCallout = true
        
        let iconImage = UIImageView(image: UIImage(named: "icon1"))
        iconImage.frame = CGRect(x: 0.0, y: 0.0, width: 50.0, height: 50.0)
        pinView!.leftCalloutAccessoryView = iconImage
        return pinView
    }
    
    // MARK: touch event
    @IBAction func mapViewDidTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let tapPoint = sender.location(in: view)
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            positionLabel.text = "緯度: \(center.latitude), 経度: \(center.longitude)"
            print(center)
            //            let circle = MKCircle(center: center, radius: 100)
            //            mapView.add(circle)
        }
    }
    
}

