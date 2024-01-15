//
//  HomeView.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import SwiftUI

struct HomeView: View {
    
    let service = WebService()
    
    @State private var specialists: [Specialist] = []
    
    var viewModel = HomeViewModel(service: HomeNetworkingService())
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .padding(.vertical, 32)
                Text("Boas-vindas!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color(.lightBlue))
                Text("Veja abaixo os especialistas da Voll disponíveis e marque já a sua consulta!")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 16)
                ForEach(specialists) { specialist in
                        SpecialistCardView(specialist: specialist)
                        .padding(.bottom, 8)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear {
            Task {
                do {
                    guard let response = try await viewModel.getSpecialists() else { return }
                    self.specialists = response
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    Task {
                        await viewModel.logout()
                    }
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Logout")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
