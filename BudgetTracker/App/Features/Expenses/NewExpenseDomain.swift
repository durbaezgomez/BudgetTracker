//
//  NewExpenseDomain.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 05/11/2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct NewExpenseDomain {
    @ObservableState
    struct State {
        var title: String = ""
        var amountString: String = ""
        var amount: Double = 0
        var date: Date = .init()
        var category: Category? = nil
    }
    
    enum Action {
        case didChangeTitle(String)
        case didChangeAmount(String)
        case didChangeDate(Date)
        case didChangeCategory(Category?)
        case didTapSubmit
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .didChangeTitle(let title):
                state.title = title
                return .none
            case .didChangeAmount(let amountString):
                state.amountString = amountString
                state.amount = Double(amountString) ?? 0.0
                return .none
            case .didChangeDate(let date):
                state.date = date
                return .none
            case .didChangeCategory(let category):
                state.category = category
                return .none
            case .didTapSubmit:
                // TODO: Handle submit
                return .none
            }
        }
    }
}
