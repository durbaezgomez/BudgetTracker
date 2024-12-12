//
//  MainView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    enum TabItem: Int, CaseIterable {
        case stats = 0
        case home
        case budget
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .stats: return "chart.pie"
            case .budget: return "wallet.bifold"
            }
        }
    }
    
    @State var selectedTab = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    StatsView()
                        .tag(0)
                    ExpensesView(
                        store: Store(initialState: ExpensesDomain.State()) {
                            ExpensesDomain()
                        }
                    ).tag(1)
                    BudgetView()
                        .tag(2)
                }
                .ignoresSafeArea()
                .animation(.easeInOut, value: selectedTab)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { item in
                        MenuButton(isSelected: selectedTab == item.rawValue, icon: item.icon)
                            .onTapGesture {
                                if selectedTab != item.rawValue {
                                    selectedTab = item.rawValue
                                }
                            }
                    }
                    .animation(.default, value: selectedTab)
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity)
                .background(Color.secondary)
            }
        }
    }
}

extension MainView {
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

#Preview {
    MainView()
}
