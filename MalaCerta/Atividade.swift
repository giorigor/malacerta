//
//  Atividade.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import Foundation
import CoreData

class Atividade: NSManagedObject {
	
	convenience init() {
		// Pega o nome da classe (ex: "Aluno.swift")
		let nomeClasseString = String(describing: Atividade.self)
		
		// Vincula a descrição com o arquivo acima
		let entityDescription = NSEntityDescription.entity(forEntityName: nomeClasseString, in: CoreDataManager.sharedManager().getContext())
		
		self.init(entity: entityDescription!, insertInto: CoreDataManager.sharedManager().getContext())
	}
	
}
