//
//  HomeView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

let mockExpenses: [Expense] = [
    .init(title: "Groceries", amount: 45.70, category: .food),
    .init(title: "Chemicals shopping", amount: 212.35, category: .utilities),
    .init(title: "Paris tickets", amount: 1400.99, category: .travel),
    .init(title: "Car insurance", amount: 34.50, category: .others),
    .init(title: "savings", amount: 200.00, category: .savings),
    .init(title: "Car repair", amount: 350.00, category: .utilities),
    .init(title: "Chocolate", amount: 15.00, category: .food),
]

struct RecentExpensesView: View {
    let store: StoreOf<RecentExpenses>
    
    var body: some View {
        ZStack {
            VStack {
                Text("Recent expenses")
                    .font(.Custom.headline)
                ExpensesTopRow()
                ScrollView {
                    VStack(spacing: 5) {
                        ForEach(store.expenses, id: \.id) { expense in
                            ExpenseRow(expense: expense)
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
                
                HStack(spacing: 0) {
                    Spacer()
                    Button(
                        action: {
                            store.send(.addNewExpense(mockExpenses[1]))
                        }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(20)
                                .foregroundColor(.white)
                                .background(Color.secondary)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .cornerRadius(10)
                        }
                    )
                    .padding(.horizontal, 30)
                }
                Spacer()
            }
            .padding(.horizontal, 5)
        }
        .frame(maxWidth: .infinity)
        .background(Color.secondary.opacity(0.5))
    }
}

// Expense Row
extension RecentExpensesView {
    struct ExpenseRow: View {
        var expense: Expense
        
        var body: some View {
            HStack(spacing: 0) {
                Text(expense.title)
                    .font(.Custom.body10)
                    .lineLimit(2)
                    .frame(width: 100, alignment: .leading)
                Text(expense.date, format: .dateTime)
                    .font(.Custom.body10)
                    .frame(width: 65, alignment: .leading)
                Spacer()
                Text(expense.amount.formatted(.currency(code: "$")))
                    .font(.Custom.body10)
                Spacer()
                Text(expense.category.title)
                    .font(.Custom.body10)
                    .foregroundStyle(Color.accentSecondary)
                    .frame(width: 60, alignment: .center)
            }
            .padding(.horizontal, 15)
            .frame(width: 350, height: 35)
            .cornerRadius(5)
        }
    }
}

extension RecentExpensesView {
    struct ExpensesTopRow: View {
        var body: some View {
            HStack(spacing: 0) {
                Text("Title")
                    .font(.Custom.body10)
                    .lineLimit(2)
                    .frame(width: 100, alignment: .leading)
                Text("Date")
                    .font(.Custom.body10)
                Spacer()
                Text("Amount")
                    .font(.Custom.body10)
                Spacer()
                Text("Category")
                    .font(.Custom.body10)
                    .frame(width: 60, alignment: .center)
            }
            .padding(.horizontal, 15)
            .frame(width: 350, height: 35)
            .background(Color.secondary.opacity(0.3))
            .cornerRadius(5)
        }
    }
}

#Preview {
    RecentExpensesView(
        store: Store(
            initialState: RecentExpenses.State(expenses: [])
        ) {
            RecentExpenses()
        }
    )
}
