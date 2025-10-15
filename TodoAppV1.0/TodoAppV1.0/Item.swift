//
//  Item.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
