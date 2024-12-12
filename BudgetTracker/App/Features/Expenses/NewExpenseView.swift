//
//  NewExpenseView.swift
//  BudgetTracker
//
//  Created by Dominik Urbaez Gomez on 03/11/2024.
//

import SwiftUI
import ComposableArchitecture

struct NewExpenseView: View {
    @Bindable var store: StoreOf<NewExpenseDomain>
    
    var body: some View {
        ZStack {
            VStack {
                Text("New Expense")
                    .font(.headline)
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading) {
                    TextField("what was it?", text: $store.title.sending(\.didChangeTitle))
                        .padding(10)
                    TextField("how much?", text: $store.amountString.sending(\.didChangeAmount))
                        .keyboardType(.numbersAndPunctuation)
                        .padding()
                    DatePicker("when?", selection: $store.date.sending(\.didChangeDate))
//                    Picker("category", selection: $store.category.sending(\.didChangeCategory)) {
//                        ForEach(Category.allCases) { category in
//                            Text(category.rawValue)
//                        }
//                    }
                    Spacer()
                }
                
                Button("Add Expense") {
                    store.send(.didTapSubmit)
                }
            }
            .padding(10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondary)
    }
}

#Preview {
    NewExpenseView(
        store: Store(
            initialState: NewExpenseDomain.State()) {
                NewExpenseDomain()
            }
    )
}
