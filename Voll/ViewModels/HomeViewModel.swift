//
//  HomeViewModel.swift
//  Voll
//
//  Created by Marcio Curvello on 11/01/24.
//

import Foundation

struct HomeViewModel {
    
    // MARK: - Attributes
    
    let service: HomeServiceable
    var authManager = AuthenticationManager.shared
    
    // MARK: - Init
    
    init(service: HomeServiceable) {
        self.service = service
    }

    // MARK: - Class methods
    
    func getSpecialists() async throws -> [Specialist]? {
        let result = try await service.getAllSpecialists()
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    func logout() async {
        let oldService = WebService()
        do {
            let response = try await oldService.logoutPatient()
            if response {
                authManager.removeToken()
                authManager.removePatientID()
            }
        } catch {
            print("Ocorreu um erro no logout: \(error)")
        }
    }
}
