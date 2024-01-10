//
//  SignInView.swift
//  Voll
//
//  Created by Marcio Curvello on 09/01/24.
//

import SwiftUI

struct SignInView: View {
    
    let service = WebService()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    
    func login() async {
        do {
            if let response = try await service.loginPatient(email: email, password: password) {
                UserDefaultsHelper.save(value: response.token, key: "token")
                UserDefaultsHelper.save(value: response.id, key: "patient-id")
            } else {
                showAlert = true
            }
        } catch {
            showAlert = true
            print("Ocorreu um erro no login: \(error)")
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
            Text("Olá")
                .font(.title2)
                .bold()
                .foregroundStyle(.accent)
            Text("Preencha para acessar sua conta.")
                .font(.title3)
                .foregroundStyle(.gray)
                .padding(.bottom)
            Text("Email")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            TextField("Insira seu email", text: $email)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            Text("Senha")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
            SecureField("Insira seu senha", text: $password)
                .padding(14)
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14)
            
            Button {
                Task {
                    await login()
                }
            } label: {
                ButtonView(text: "Entrar")
            }
            
            NavigationLink {
                SignUpView()
            } label: {
                Text("Ainda não possui uma conta? Cadastre-se.")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
            }

        }
        .padding()
        .navigationBarBackButtonHidden()
        .alert("Ops, algo deu errado!", isPresented: $showAlert) {
            Button(action: {}, label: {
                Text("Ok")
            })
        } message: {
            Text("Houve um erro ao entrar na sua conta. Por favor tente novamente.")
        }

    }
}

#Preview {
    SignInView()
}
