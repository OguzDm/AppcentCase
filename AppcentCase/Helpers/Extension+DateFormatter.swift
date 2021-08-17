//
//  Extension+DateFormatter.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 17.08.2021.
//

import Foundation

extension DateFormatter {
    
    func convertDateFormater(_ date: String) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "dd MMM yyyy"
            return  dateFormatter.string(from: date!)
        }
}
