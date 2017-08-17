//
//  ViagemDAO.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation

class ViagemDAO {
	static func getViagens() -> [Viagem] {
		let viagem = Viagem()
		viagem.titulo = "Caeté"
		
		var componentesData = DateComponents()
		componentesData.day = 28
		componentesData.month = 10
		componentesData.year = 2018
		componentesData.hour = 14
		componentesData.timeZone = TimeZone(abbreviation: "BRT")
		
		viagem.inicio = NSDate(timeIntervalSinceNow: 123456789.0)
		viagem.fim = NSDate(timeInterval: 123456789.0, since: (viagem.inicio as Date?)!)
		
		let atividades = AtividadeDAO.getAtividades()
		
		for ativ: Atividade in atividades {
			viagem.addToAtivsDaViagem(ativ)
			ativ.viagemPai = viagem
		}
		
		return [viagem]
	}
}
