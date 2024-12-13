//
//  Category.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI

enum Category: CaseIterable {    
    case food
    case utilities
    case travel
    case savings
    case others
    
    var title: String {
        switch self {
        case .food: return "Food"
        case .utilities: return "Utilities"
        case .travel: return "Travel"
        case .savings: return "Savings"
        case .others: return "Other"
        }
    }
    
    var color: Color {
        switch self {
        case .food: return Color.green
        case .utilities: return Color.blue
        case .travel: return Color.yellow
        case .savings: return Color.orange
        case .others: return Color.purple
        }
    }
}
