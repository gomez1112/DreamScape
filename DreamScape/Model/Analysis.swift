//
//  Analysis.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/27/24.
//

import Foundation
import SwiftData

@Model
final class Analysis {
    var interpretation: String
    var sentiment: Int
    
    init(interpretation: String, sentiment: Int) {
        self.interpretation = interpretation
        self.sentiment = sentiment
    }
}
