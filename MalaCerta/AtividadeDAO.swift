//
//  ViagemDAO.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation

class AtividadeDAO {
	static func getAtividades() -> [Atividade] {
		let atividade = Atividade()
		atividade.titulo = "Visita ao Museu de Arte Moderna"
		
		var componentesData = DateComponents()
		componentesData.day = 28
		componentesData.month = 10
		componentesData.year = 2018
		componentesData.hour = 14
		componentesData.minute = 20
		componentesData.timeZone = TimeZone(abbreviation: "BRT")
		
		let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)

		
		atividade.inicio = calendar?.date(from: componentesData)! as NSDate?
		
		componentesData.hour = 16
		atividade.fim = calendar?.date(from: componentesData)! as NSDate?
        
        atividade.latitude = -19.932098
        atividade.longitude = -43.937290

		
		
		let atividade2 = Atividade()
		atividade2.titulo = "Jantar no Porcão"
		
		componentesData.day = 29
		componentesData.hour = 21
		componentesData.minute = 00
		
		atividade2.inicio = calendar?.date(from: componentesData)! as NSDate?
		componentesData.hour = 23
		atividade2.fim = calendar?.date(from: componentesData)! as NSDate?
        
        atividade2.latitude = -19.960421
        atividade2.longitude = -43.957247

		
		return [atividade, atividade2]
	}
}
