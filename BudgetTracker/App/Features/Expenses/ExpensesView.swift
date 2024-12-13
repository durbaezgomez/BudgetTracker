//
//  ExpensesView..swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

struct ExpensesView: View {
    @Bindable var store: StoreOf<ExpensesFeature>
    @State private var displayLimit = 6
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Recent expenses")
                    .font(.headline)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 20)
                
                ScrollViewReader { proxy in
                    List {
                        ForEach(Array(store.expenses.prefix(displayLimit))) { expense in
                            ExpenseRow(expense: expense)
                                .id(expense.id)
                        }
                    }
                    .listStyle(.plain)
                    .onChange(of: displayLimit) { oldValue, newValue in
                        if let lastId = store.expenses.prefix(oldValue).last?.id {
                            withAnimation {
                                proxy.scrollTo(lastId, anchor: .top)
                            }
                        }
                    }
                }
            }
            
            if displayLimit < store.expenses.count {
                VStack {
                    Spacer()
                    Button {
                        displayLimit += 6
                    } label: {
                        Text("load more")
                            .lineLimit(1)
                            .padding()
                            .foregroundStyle(Color.primary)
                            .background(.white)
                            .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .padding(.horizontal, 125)
                    .padding(.bottom, 15)
                    .shadow(color: .black.opacity(0.06), radius: 10)
                }
            }
            
            AddNewExpenseButton(action: { store.send(.addButtonTapped) })
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
        .sheet(item: $store.scope(state: \.addExpense, action: \.addExpense)) { addExpenseStore in
            AddExpenseView(store: addExpenseStore)
            .presentationDetents([.fraction(0.45)])
        }
    }
}

private struct AddNewExpenseButton: View {
    var action: () -> Void
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: action) {
                    Image(systemName: "plus")
                        .font(.title)
                        .padding(10)
                        .background(Color.white)
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.06), radius: 10)
                }
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
    }
}

private struct ExpenseRow: View {
    var expense: Expense
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if !expense.note.isEmpty {
                    Text(expense.note)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                Spacer()
                Text(String(format: "%.2f", expense.amount))
                    .font(.headline)
            }
            
            Text(expense.category.title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(expense.date, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .listRowBackground(Color.background)
    }
}

#Preview {
    ExpensesView(
        store: Store(
            initialState: ExpensesFeature.State()) {
                ExpensesFeature()
            }
    )
}
