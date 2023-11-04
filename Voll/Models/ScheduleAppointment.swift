//
//  ScheduleAppointment.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import Foundation

struct ScheduleAppointmentResponse: Codable, Identifiable {
    let id: String
    let specialist: String
    let patient: String
    let date: String
    let reasonToCancel: String?
    let wantAdvice: Bool?
    let advices: Array<String>?
    
    enum CodingKeys: String, CodingKey {
        case id
        case specialist = "especialista"
        case patient = "paciente"
        case date = "data"
        case reasonToCancel = "motivoCancelamento"
        case wantAdvice = "desejaLembrete"
        case advices = "lembretes"
    }
}

struct ScheduleAppointmentRequest: Codable {
    let specialist: String
    let patient: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case specialist = "especialista"
        case patient = "paciente"
        case date = "data"
    }
}
