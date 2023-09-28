//
//  Item.swift
//  StateNavigationDemo
//
//  Created by mark on 9/28/23.
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
