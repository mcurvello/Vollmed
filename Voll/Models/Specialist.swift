//
//  Specialist.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import Foundation

struct Specialist: Identifiable, Codable {
    let id: String
    let name: String
    let crm: String
    let imageUrl: String
    let specialty: String
    let email: String
    let phoneNumber: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "nome"
        case crm
        case imageUrl = "imagem"
        case specialty = "especialidade"
        case email
        case phoneNumber = "telefone"
    }
}
