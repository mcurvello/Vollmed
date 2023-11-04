//
//  Date+.swift
//  Voll
//
//  Created by Marcio Curvello on 04/11/23.
//

import Foundation

extension Date {
    func convertDateToString() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        return dateFormatter.string(from: self)
    }
}
