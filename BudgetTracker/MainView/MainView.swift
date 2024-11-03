//
//  MainView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI

struct MainView: View {
    enum TabItem: Int, CaseIterable {
        case stats = 0
        case home
        case addNew
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .stats: return "chart.pie.fill"
            case .addNew: return "plus"
            }
        }
    }
    
    @State var selectedTab = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                StatsView()
                    .tag(0)
                HomeView()
                    .tag(1)
                AddNewExpenseView()
                    .tag(2)
            }
            
            ZStack {
                HStack {
                    ForEach(TabItem.allCases, id: \.self) { item in
                        MenuButton(isSelected: selectedTab == item.rawValue, icon: item.icon)
                            .onTapGesture {
                                if selectedTab != item.rawValue {
                                    selectedTab = item.rawValue
                                }
                            }
                    }
                }
            }
            .animation(.default, value: selectedTab)
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
                .foregroundStyle(Color.primary.opacity(isSelected ? 0.7 : 0.3))
                .frame(width: size, height: size)
                .padding(20)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .animation(.default, value: isSelected)
        }
    }
}

#Preview {
    MainView()
}
