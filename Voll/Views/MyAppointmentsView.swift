//
//  MyAppointmentsView.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import SwiftUI

struct MyAppointmentsView: View {
    
    let service = WebService()
    
    @State private var appointments: [Appointment] = []
    
    func getAllAppointments() async {
        
        guard let patientID = KeychainHelper.get(for: "app-voll-patient-id") else {
            return
        }
        
        do {
            if let appointments = try await service.getAllAppointmentsFromPatient(patientID: patientID) {
                self.appointments = appointments
            }
        } catch {
            print("Ocorreu um erro ao obter consultar: \(error)")
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(appointments) { appointment in
                SpecialistCardView(specialist: appointment.specialist, appointment: appointment)
            }
        }
        .navigationTitle("Minhas consultas")
        .navigationBarTitleDisplayMode(.large)
        .padding()
        .onAppear {
            Task {
                await getAllAppointments()
            }
        }
    }
}

#Preview {
    MyAppointmentsView()
}
