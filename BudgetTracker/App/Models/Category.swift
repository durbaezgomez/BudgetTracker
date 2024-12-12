//
//  Category.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

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
}
