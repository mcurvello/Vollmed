//
//  AuthenticationManager.swift
//  Voll
//
//  Created by Marcio Curvello on 11/01/24.
//

import Foundation

class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    
    @Published var token: String?
    @Published var patientID: String?
    
    private init() {
        self.token = KeychainHelper.get(for: "app-voll-token")
        self.patientID = KeychainHelper.get(for: "app-voll-patient-id")
    }
    
    func saveToken(token: String) {
        KeychainHelper.save(value: token, key: "app-voll-token")
        self.token = token
    }
    
    func removeToken() {
        KeychainHelper.remove(for: "app-voll-token")
        self.token = nil
    }
    
    func savePatientID(id: String) {
        KeychainHelper.save(value: id, key: "app-voll-patient-id")
        self.patientID = id
    }
    
    func removePatientID() {
        KeychainHelper.remove(for: "app-voll-patient-id")
        self.patientID = nil
    }
}
