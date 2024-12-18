//
//  AppFeature.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 13/12/2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct AppFeature {
    
    @ObservableState
    struct State: Equatable {
        var selectedTab: Tab = .expenses
        var expenses: ExpensesFeature.State?
        var stats: StatsFeature.State?
        var budget: BudgetFeature.State?
        
        enum Tab: Int, CaseIterable {
            case stats = 0
            case expenses
            case budget
            
            var icon: String {
                switch self {
                case .expenses: return "house"
                case .stats: return "chart.pie"
                case .budget: return "wallet.bifold"
                }
            }
        }
    }
    
    enum Action {
        case selectedTabChanged(State.Tab)
        case expenses(ExpensesFeature.Action)
        case stats(StatsFeature.Action)
        case budget(BudgetFeature.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .selectedTabChanged(let tab):
                state.selectedTab = tab
                return .none
                
            case .expenses, .stats, .budget:
                return .none
            }
        }
        .ifLet(\.expenses, action: \.expenses) {
            ExpensesFeature()
        }
        .ifLet(\.stats, action: \.stats) {
            StatsFeature()
        }
        .ifLet(\.budget, action: \.budget) {
            BudgetFeature()
        }
    }
}
