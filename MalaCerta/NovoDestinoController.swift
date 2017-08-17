//
//  ViewController.swift
//  MapLocator
//
//  Created by Malek T. on 9/28/16.
//  Copyright © 2016 Medigarage Studios LTD. All rights reserved.
//

import UIKit
import MapKit

class NovoDestinoController: UIViewController, UISearchBarDelegate {
	@IBAction func buttonProssegue(_ sender: Any) {
		
	}
    
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
	
	var localllll: MKMapItem!
    
    @IBOutlet var mapView: MKMapView!

    @IBAction func showSearchBar(_ sender: AnyObject) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
		if (self.pointAnnotation != nil) {
			self.mapView.removeAnnotation(self.pointAnnotation)
		}
        //1
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0]
            self.mapView.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                let alertController = UIAlertController(title: nil, message: "Local não encontrado!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Desculpe", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = (localSearchResponse?.mapItems[0].placemark.coordinate)!
			self.localllll = (localSearchResponse?.mapItems[0])!

			//CLLocationCoordinate2D(latitude: localSearchResponse!.boundingRegion.center.latitude, longitude:     localSearchResponse!.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
			
            self.mapView.addAnnotation(self.pinAnnotationView.annotation!)
			
//			let span = MKCoordinateSpanMake(0.05, 0.05)
//			let region = MKCoordinateRegionMake(localSearch.c, span)
//			mapView.setRegion(region, animated: true)
        }
    }
	
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "localSelecionado"{
			if let novaView = segue.destination as? AdcNovoLocalController{
				novaView.endereco = self.localllll
			}
		}
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	
	
	
}

