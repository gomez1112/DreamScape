//
//  Category.swift
//  DreamScape
//
//  Created by Gerard Gomez on 1/27/24.
//

import Foundation
import SwiftData

@Model
final class Category {
    var title: String
    @Relationship(deleteRule: .cascade, inverse: \Dream.category)
    var dreams: [Dream] = []
    
    init(title: String) {
        self.title = title
    }
}
