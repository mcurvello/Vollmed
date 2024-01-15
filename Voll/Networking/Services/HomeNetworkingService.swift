//
//  HomeNetworkingService.swift
//  Voll
//
//  Created by Marcio Curvello on 15/01/24.
//

import Foundation

protocol HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError>
}

struct HomeNetworkingService: HTTPClient, HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getAllSpecialists, responseModel: [Specialist].self)
    }
}
