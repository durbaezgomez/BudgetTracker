//
//  AppView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                TabView(selection: $store.selectedTab.sending(\.selectedTabChanged)) {
                    
                    StatsView(
                        store: store.scope(
                            state: \.stats!,
                            action: \.stats
                        )
                    )
                    .tag(AppFeature.State.Tab.stats)
                    
                    ExpensesView(
                        store: store.scope(
                            state: \.expenses!,
                            action: \.expenses
                        )
                    )
                    .tag(AppFeature.State.Tab.expenses)
                    
                    BudgetView(
                        store: store.scope(
                            state: \.budget!,
                            action: \.budget
                        )
                    )
                    .tag(AppFeature.State.Tab.budget)
                }
                .animation(.easeInOut, value: store.selectedTab)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                TabMenu(store: store)
            }
        }
        .background(Color.background)
    }
}

extension AppView {
    struct MenuButton: View {
        var isSelected: Bool
        var icon: String
        var size: CGFloat {
            isSelected ? 30 : 20
        }
        
        var body: some View {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.primary.opacity(isSelected ? 1 : 0.6))
                .frame(width: size, height: size)
                .padding(20)
                .background(Color.white)
                .cornerRadius(10)
                .animation(.bouncy, value: isSelected)
        }
    }
}

extension AppView {
    struct TabMenu: View {
        var store: StoreOf<AppFeature>
        
        var body: some View {
            HStack {
                ForEach(AppFeature.State.Tab.allCases, id: \.self) { tab in
                    MenuButton(isSelected: store.selectedTab == tab, icon: tab.icon)
                        .onTapGesture {
                            if store.selectedTab != tab {
                                store.send(.selectedTabChanged(tab))
                            }
                        }
                }
                .animation(.default, value: store.selectedTab)
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity)
            .background(Color.background)
        }
    }
}

#Preview {
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
