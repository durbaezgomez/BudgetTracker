//
//  ExpensesView..swift
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

struct ExpensesView: View {
    @Bindable var store: StoreOf<ExpensesDomain>
    
    var body: some View {
        ZStack {
            VStack {
                Text("Expenses")
                    .font(.Custom.headline)
                ExpensesTopRow()
//                List {
//                    ForEach(store.expenses) { expense in
//                        ExpenseRow(expense: expense)
//                    }
//                }
                .padding(.horizontal, 30)
                .padding(.bottom, 10)
                
                HStack(spacing: 0) {
                    Spacer()
                    Button(
                        action: {
                            store.send(.addExpenseTapped)
                        }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(15)
                                .foregroundColor(.white)
                                .background(Color.primary.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .cornerRadius(10)
                        }
                    )
                    .padding(.horizontal, 30)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.secondary)
        .sheet(isPresented: $store.showAddExpense.sending(\.setSheet)) {
            NewExpenseView(
                store: Store(initialState: NewExpenseDomain.State())
                { NewExpenseDomain()
                }
            )
            .presentationDetents([.medium])
        }
    }
}

// Expense Row
extension ExpensesView {
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
            .cornerRadius(5)
        }
    }
}

extension ExpensesView {
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
            .background(Color.primary.opacity(0.1))
            .cornerRadius(5)
        }
    }
}

#Preview {
    ExpensesView(
        store: Store(
            initialState: ExpensesDomain.State()) {
            ExpensesDomain()
        }
    )
}
