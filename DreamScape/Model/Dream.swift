//
//  Dream.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/27/24.
//

import Foundation
import SwiftData

@Model
final class Dream {
    var title: String
    var detail: String?
    var date: Date
    var mood: Mood
    var isNightmare = false
    var sleepQuality: SleepQuality
    var analysis: Analysis
    var tags: [String] = []
    var symbol: String
    @Attribute(.externalStorage)
    var photoData: Data?
    var location: String?
    
    init(title: String, detail: String? = nil, date: Date, mood: Mood, sleepQuality: SleepQuality, analysis: Analysis, symbol: String) {
        self.title = title
        self.detail = detail
        self.date = date
        self.mood = mood
        self.sleepQuality = sleepQuality
        self.analysis = analysis
        self.symbol = symbol
    }
    
    enum Mood: String, Codable, Identifiable, CaseIterable {
        case happy, scared, confused, sad, indifferent
        var id: Self { self }
    }
    enum SleepQuality: Int, Codable {
        case poor = 1
        case fair = 2
        case good = 3
        case veryGood = 4
        case excellent = 5
        
        var description: String {
            switch self {
                case .poor:
                    return "Poor"
                case .fair:
                    return "Fair"
                case .good:
                    return "Good"
                case .veryGood:
                    return "Very Good"
                case .excellent:
                    return "Excellent"
            }
        }
    }

}
