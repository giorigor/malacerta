//
//  UsuarioController.swift
//  MalaCerta
//
//  Created by Student on 17/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class UsuarioController: UIViewController {

	var usuario = UsuarioDAO.getUsuario()
	
	@IBOutlet weak var bioLabel: UITextView!
	@IBOutlet weak var localLabel: UILabel!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var photo: UIImageView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		bioLabel.text = usuario.biografia
		nomeLabel.text = usuario.nome
		localLabel.text = usuario.localizacao
		photo.image = UIImage(named: usuario.foto!)
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
