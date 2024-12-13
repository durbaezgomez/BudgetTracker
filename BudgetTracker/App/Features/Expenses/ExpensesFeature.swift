//
//  ExpensesFeature.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct ExpensesFeature {
    @ObservableState
    struct State: Equatable {
        @Presents var addExpense: AddExpenseFeature.State?
        var expenses: IdentifiedArrayOf<Expense> = []
    }
    
    enum Action {
        case addButtonTapped
        case addExpense(PresentationAction<AddExpenseFeature.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.addExpense = AddExpenseFeature.State(
                    note: "",
                    amount: "",
                    amountDouble: 0.0,
                    date: Date(),
                    category: .others
                )
                return .none
                
            case .addExpense(.presented(.delegate(.saveExpense(let expense)))):
                state.expenses.append(expense)
                return .none
                
            case .addExpense:
                return .none
            }
        }
        .ifLet(\.$addExpense, action: \.addExpense) {
            AddExpenseFeature()
        }
    }
}
