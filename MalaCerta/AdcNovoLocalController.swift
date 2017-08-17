//
//  AdcNovoLocalController.swift
//  MalaCerta
//
//  Created by Student on 17/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreData

class AdcNovoLocalController: UIViewController {
	
	@IBOutlet weak var dataInicioField: UITextField!
	@IBOutlet weak var dataFimField: UITextField!
	@IBOutlet weak var localTextField: UITextField!
	
	var endereco: MKMapItem!
	
	var viagem: Viagem!
	

    override func viewDidLoad() {
        super.viewDidLoad()
		localTextField.text = endereco.placemark.title
		// Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneAdcLocal"{
			viagem = Viagem()
			viagem.titulo = endereco.placemark.title
			//viagem.local = endereco
			let dateFormatter = DateFormatter()
			dateFormatter.dateFormat = "dd MM yyyy"
			viagem.inicio = dateFormatter.date(from: dataInicioField.text!)! as NSDate
			viagem.fim = dateFormatter.date(from: dataFimField.text!)! as NSDate
			
			CoreDataManager.sharedManager().saveContext()
			
			if let timelineView = segue.destination as? TimelineController {
				timelineView.viagemSelecionada = viagem
			}
			
			
		}

		
    }
	

}
