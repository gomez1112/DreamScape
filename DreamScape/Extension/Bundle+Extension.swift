//
//  Bundle+Extension.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/27/24.
//

import Foundation

extension Bundle {
    func getAPIKey() -> String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
              let config = NSDictionary(contentsOfFile: path),
              let apiKey = config["APIKey"] as? String else { return "" }
        return apiKey
    }
}
