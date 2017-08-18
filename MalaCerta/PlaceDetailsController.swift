//
//  PlaceDetailsController.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PlaceDetailsController: UIViewController {
	
	var atividadeSelecionada: Atividade!
	
    @IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var horarioLabel: UILabel!
	@IBOutlet weak var localLabel: UILabel!

	@IBOutlet weak var enderecoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
		
		localLabel.text = atividadeSelecionada.titulo
		enderecoLabel.text = atividadeSelecionada.endereco
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "pt_BR")
        horarioLabel.text = "\(dateFormatter.string(from: atividadeSelecionada.inicio! as Date))  até  \(dateFormatter.string(from: atividadeSelecionada.fim! as Date))"
        
        var mapRegion = MKCoordinateRegion()
        var coordinate = CLLocationCoordinate2D()
        coordinate.latitude = atividadeSelecionada.latitude
        coordinate.longitude = atividadeSelecionada.longitude
        mapRegion.center = coordinate
        mapRegion.span.latitudeDelta = 0.05
        mapRegion.span.longitudeDelta = 0.05
        mapView.setRegion(mapRegion, animated: false)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
