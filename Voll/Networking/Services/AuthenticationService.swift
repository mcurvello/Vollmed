//
//  AuthenticationService.swift
//  Voll
//
//  Created by Marcio Curvello on 16/01/24.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
}
