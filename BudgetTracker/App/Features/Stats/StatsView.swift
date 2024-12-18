//
//  StatsView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

struct StatsView: View {
    @Bindable var store: StoreOf<StatsFeature>
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("Stats View")
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
    }
}
