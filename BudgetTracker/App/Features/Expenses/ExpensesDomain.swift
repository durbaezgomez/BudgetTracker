//
//  ExpensesDomain.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import ComposableArchitecture

@Reducer
struct ExpensesDomain {
    @ObservableState
    struct State {
        var showAddExpense: Bool = false
    }
    
    enum Action {
        case addExpenseTapped
        case setSheet(isPresented: Bool)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .addExpenseTapped:
                if state.showAddExpense == false {
                    state.showAddExpense = true
                }
                return .none
                
            case .setSheet(let isPresented):
                state.showAddExpense = isPresented
                return .none
            }
        }
    }
}
