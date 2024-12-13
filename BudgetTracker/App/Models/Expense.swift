//
//  Expense.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import Foundation

struct Expense: Equatable, Identifiable {
    var id: UUID
    var date: Date
    
    var amount: Double
    var category: Category
    var note: String
    
    var dateString: String {
        date.formatted(.dateTime)
    }
    
    var amountString: String {
        String(format: "$%.02f", amount)
    }
}
