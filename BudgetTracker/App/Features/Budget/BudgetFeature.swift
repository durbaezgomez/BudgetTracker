//
//  BudgetFeature.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 13/12/2024.
//

import ComposableArchitecture
import Foundation

@Reducer
struct BudgetFeature {
    
    @ObservableState
    struct State: Equatable {
        
    }
    
    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            
            }
        }
    }
}
