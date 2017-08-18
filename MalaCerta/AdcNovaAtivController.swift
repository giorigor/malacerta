//
//  AdcNovaAtivController.swift
//  MalaCerta
//
//  Created by Igor on 18/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit

class AdcNovaAtivController: UIViewController {
    
    
    @IBOutlet weak var localTextField: UITextField!
    
    @IBOutlet weak var inicioTextField: UITextField!
    @IBOutlet weak var fimTextField: UITextField!
    
    var endereco: MKMapItem!
    
    var viagem: Viagem!
    
    var ativ: Atividade!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        localTextField.text = endereco.placemark.title

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
