//
//  RecentExpenses.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import ComposableArchitecture

@Reducer
struct RecentExpenses {
    @ObservableState
    struct State {
        var expenses: [Expense] = []
    }
    
    enum Action {
        case addNewExpense(Expense)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .addNewExpense(let expense):
                    state.expenses.append(expense)
                    return .none
            }
        }
    }
}
