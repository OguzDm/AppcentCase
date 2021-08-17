//
//  Extension+URLComponents.swift
//  AppcentCase
//
//  Created by Oguz Demırhan on 17.08.2021.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
