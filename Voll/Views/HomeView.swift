//
//  HomeView.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import SwiftUI

struct HomeView: View {
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
                    .foregroundColor(Color(.lightBlue))
                Text("Veja abaixo os especialistas da Voll disponíveis e marque já a sua consulta!")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.accentColor)
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
    }
}

#Preview {
    HomeView()
}
