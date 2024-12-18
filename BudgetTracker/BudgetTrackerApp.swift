//
//  BudgetTrackerApp.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct BudgetTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(
                    initialState: AppFeature.State(
                        expenses: ExpensesFeature.State(),
                        stats: StatsFeature.State(),
                        budget: BudgetFeature.State()
                    )
                ) {
                    AppFeature()
                }
            )
        }
    }
}
