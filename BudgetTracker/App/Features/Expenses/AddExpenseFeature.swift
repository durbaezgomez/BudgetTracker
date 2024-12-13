//
//  AddExpenseFeature.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 05/11/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddExpenseFeature {
    @ObservableState
    struct State: Equatable {
        var note: String
        var amount: String
        var amountDouble: Double
        var date: Date
        var category: Category
    }
    
    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case setAmountDouble(Double)
        case saveTapped
        case cancelTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case saveExpense(Expense)
        }
    }
    
    @Dependency(\.dismiss) var dismiss
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .delegate(_):
                return .none
                
            case .cancelTapped:
                return .run { _ in await self.dismiss() }
                
            case .saveTapped:
                let expense = Expense(
                    id: UUID(),
                    date: state.date,
                    amount: state.amountDouble,
                    category: state.category,
                    note: state.note
                )
                return .run { [expense = expense] send in
                    await send(.delegate(.saveExpense(expense)))
                    await self.dismiss()
                }
                
            case .setAmountDouble(let amountDouble):
                state.amountDouble = amountDouble
                return .none
                
            case .binding(\.amount):
                guard let amountDouble = Double(state.amount) else { return .none }
                return .run { send in
                    await send(.setAmountDouble(amountDouble))
                }
            case .binding(_):
                return .none
            }
        }
    }
}
