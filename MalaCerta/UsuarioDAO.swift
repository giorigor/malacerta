//
//  UsuarioDAO.swift
//  MalaCerta
//
//  Created by Student on 17/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation

class UsuarioDAO {
	static func getUsuario() -> Usuario {
		let usuario = Usuario()
		usuario.nome = "Igor Camargos"
		usuario.localizacao = "Belo Horizonte, MG"
		usuario.biografia = "Estudante de engenharia de software, viajando só na maionese por que dinheiro que é bom eu não tenho não."
		usuario.foto = "igor"
		return usuario
	}
}
