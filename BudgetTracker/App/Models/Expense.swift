//
//  Expense.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import Foundation

struct Expense {
    var title: String
    var amount: Double
    var date: Date = Date()
    var category: Category
}
