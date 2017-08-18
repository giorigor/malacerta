//
//  TimelineController.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class TimelineController: UITableViewController {
	
	var viagemSelecionada: Viagem!
	
	var atividades: [Atividade]!
    
    var mapView = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		atividades = viagemSelecionada.ativsDaViagem?.allObjects as! [Atividade]
        atividades.sort(by: { $1.inicio?.compare($0.inicio! as Date) == ComparisonResult.orderedDescending} )

		
//		navigationItem

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (viagemSelecionada.ativsDaViagem?.count)!
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineTableIdentifier", for: indexPath)

        if let novaCell = cell as? TimelineCell {
            novaCell.atividadeLabel.text = atividades[indexPath.row].titulo
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .short
            dateFormatter.locale = Locale(identifier: "pt_BR")
            
            novaCell.horaLabel.text = dateFormatter.string(from: atividades[indexPath.row].inicio! as Date)
            novaCell.hora2Label.text = dateFormatter.string(from: atividades[indexPath.row].fim! as Date)
            
//            let request = MKDirectionsRequest()
//            
//            
//            if indexPath.row == 0 {
//                request.source = MKMapItem(placemark: MKPlacemark(coordinate: mapView.userLocation.coordinate))
//            } else {
//                request.source = MKMapItem(placemark: MKPlacemark(coordinate: MKCoordinateForMapPoint(MKMapPointMake(atividades[indexPath.row - 1].latitude, atividades[indexPath.row - 1].longitude))))
//            }
//            request.destination = MKMapItem(placemark: MKPlacemark(coordinate: MKCoordinateForMapPoint(MKMapPointMake(atividades[indexPath.row].latitude, atividades[indexPath.row].longitude))))
//            
//            request.requestsAlternateRoutes = false
//            
//            let directions = MKDirections(request: request)
//            
//            var resposta: MKDirectionsResponse!
//            
//            directions.calculate(completionHandler: {
//                (response, error) in
//                if error == nil {
//                    resposta = response!
//                }
//            })
//            
//            let route = resposta.routes.last
//            novaCell.alertaLabel.text = "Saia em \((route?.expectedTravelTime)!/60) minutos!"
            
            
            
            
            

            var origem: MKMapPoint
            var destino: MKMapPoint
            
            if indexPath.row == 0 {
                origem = MKMapPointForCoordinate(mapView.userLocation.coordinate)
            } else {
                origem = MKMapPointMake(atividades[indexPath.row - 1].latitude, atividades[indexPath.row - 1].longitude)
            }
            destino = MKMapPointMake(atividades[indexPath.row].latitude, atividades[indexPath.row].longitude)
            
            let distancia = MKMetersBetweenMapPoints(origem, destino).binade
            
            novaCell.alertaLabel.text = "A \(distancia) metros!"


        }
		
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
		if segue.identifier == "tenhoAtividade" {
			if let ativDetailView = segue.destination as? PlaceDetailsController {
				ativDetailView.atividadeSelecionada = atividades[(tableView.indexPathForSelectedRow?.row)!]
			}
		}
		
    }


}
