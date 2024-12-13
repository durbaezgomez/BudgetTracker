import SwiftUI
import ComposableArchitecture

struct AddExpenseView: View {
    @Bindable var store: StoreOf<AddExpenseFeature>
    
    var body: some View {
        VStack(spacing: 0) {
            Form {
                AmountSection(store: store)
                NoteSection(store: store)
                DateAndCategorySection(store: store)
            }
            .listSectionSpacing(5)
            .background(Color.background)
            .scrollContentBackground(.hidden)
            
            ActionButtons(store: store)
        }
    }
}

private struct AmountSection: View {
    @Bindable var store: StoreOf<AddExpenseFeature>
    
    var body: some View {
        Section(header: Text("Amount")) {
            HStack {
                TextField("0", text: $store.amount)
                    .keyboardType(.decimalPad)
                Text("USD")
            }
        }
    }
}

private struct NoteSection: View {
    @Bindable var store: StoreOf<AddExpenseFeature>
    
    var body: some View {
        Section(header: Text("Note")) {
            TextField("", text: $store.note)
        }
    }
}

private struct DateAndCategorySection: View {
    @Bindable var store: StoreOf<AddExpenseFeature>
    
    var body: some View {
        Section(header: Text("Date and Category")) {
            HStack {
                DatePicker("Date", selection: $store.date)
                    .datePickerStyle(.compact)
                    .labelsHidden()
                Picker("",selection: $store.category) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Text(category.title).tag(category)
                    }
                }
            }
        }
    }
}

private struct ActionButtons: View {
    @Bindable var store: StoreOf<AddExpenseFeature>
    
    var body: some View {
        HStack(spacing: 50) {
            Button("Cancel", role: .cancel) {
                store.send(.cancelTapped)
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.white)
            
            Button("Confirm") {
                store.send(.saveTapped)
            }
            .padding(8)
            .buttonStyle(.plain)
            .background(.white)
            .foregroundStyle(Color.primary)
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.background)
    }
}

#Preview {
    AddExpenseView(
        store: Store(
            initialState: AddExpenseFeature.State(
                note: "",
                amount: "",
                amountDouble: 0,
                date: Date(),
                category: .food
            )
        ) {
            AddExpenseFeature()
        }
    )
}
