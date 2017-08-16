//
//  NovoDestinoController.swift
//  MalaCerta
//
//  Created by Student on 16/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class NovoDestinoController: UITableViewController , CLLocationManagerDelegate, UISearchResultsUpdating {
	
	@IBOutlet weak var buscaLocal: UISearchBar!
	
	let locationManager = CLLocationManager()
	var userLocation = CLLocation()
	
	var selectedLocation = CLLocation()
	
	var resultSearchController:UISearchController? = nil
		
	
	
	var matchingItems:[MKMapItem] = []
	var mapView: MKMapView? = nil
	
	
	func setupLocationManager () {
		// atribuindo o delegate do locationManager para esta classe
		locationManager.delegate = self
		
		// definindo o nível de precisão da localização
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		
		/*
		disparando a solicitação para que o usuário autorize o app a usar sua localização
		- além de chamar este método, é preciso também inserir no arquivo info.plist uma nova linha e incluir a chave "Privacy - Location When In Use Usage Description", para que o popup solicitando acesso ao GPS seja exibido para o usuário
		- essa mensagem só será disparada pelo app uma vez
		*/
		locationManager.requestWhenInUseAuthorization()
		
		// começa a coletar a localização
		locationManager.requestLocation()
		locationManager.startUpdatingLocation()
	}
	
	
	
	func updateSearchResults(for searchController: UISearchController) {
		guard let mapView = mapView,
			let searchBarText = searchController.searchBar.text else { return }
		let request = MKLocalSearchRequest()
		request.naturalLanguageQuery = searchBarText
		request.region = mapView.region
		let search = MKLocalSearch(request: request)
		search.start { response, _ in
			guard let response = response else {
				return
			}
			self.matchingItems = response.mapItems
			self.tableView.reloadData()
		}
	}
	
	
	
	
	
	// MARK: CLLocationManagerDelegate
	
	/*
	este método faz parte do delegate do CLLocation e é disparado automaticamente; sua estrutura deve ser mantida.
	ele é responsável por atualizar a localização
	*/
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		userLocation = locations.last!
		print("Localização atual = ", userLocation.coordinate)
	}
	
	/*
	este método faz parte do delegate do CLLocation e é disparado automaticamente; sua estrutura deve ser mantida
	ele dispara quando ocorre algum erro tentando obter a localização
	*/
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Erro ao obter a localização do usuário: ", error)
	}
	
	@nonobjc func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
		if status == .authorizedWhenInUse {
			locationManager.requestLocation()
		}
	}

	
	
	
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "NovoDestino") as! NovoDestinoController
		resultSearchController = UISearchController(searchResultsController: locationSearchTable)
		resultSearchController?.searchResultsUpdater = locationSearchTable
		
		
		
		let searchBar = resultSearchController!.searchBar
		searchBar.sizeToFit()
		searchBar.placeholder = "Buscar local"
		buscaLocal = resultSearchController?.searchBar
		
		definesPresentationContext = true
		
		
		

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return matchingItems.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pesquisaLocalIdentifier", for: indexPath)

		if let novaCell = cell as? NovoDestinoCell {
			let selectedItem = matchingItems[indexPath.row].placemark
			novaCell.nomeGrande.text = selectedItem.title
			novaCell.subtitulo.text = "\(String(describing: selectedItem.country)), \(String(describing: selectedItem.countryCode))"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
