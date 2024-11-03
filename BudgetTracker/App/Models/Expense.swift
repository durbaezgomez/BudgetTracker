//
//  Expense.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import Foundation

struct Expense: Identifiable {
    var id: UUID = UUID()
    var title: String
    var amount: Double
    var date: Date = Date()
    var category: Category
    
    var dateString: String {
        date.formatted(.dateTime)
    }
    
    var amountString: String {
        String(format: "$%.02f", amount)
    }
}
