//
//  AddExpenseView.swift
//  ExpenseTrackerPractice
//
//  Created by Mitch Andrade on 10/26/23.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    /// View Properties
    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var category: Category?
    
    /// Categories
    @Query(animation: .snappy) private var allCategories: [Category]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("Magic Keyboard", text: $title)
                }
                
                Section("Description") {
                    TextField("Bought a keyboard at the Apple Store", text: $subTitle)
                }
                
                Section("Amount Spent") {
                    
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                        
                        TextField("0.0", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                }
                
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
                
                /// Category Picker
                if !allCategories.isEmpty {
                    HStack {
                        Text("Category")
                        
                        Spacer()
                        
                        Picker("", selection: $category) {
                            ForEach(allCategories) {
                                Text($0.categoryName)
                                    .tag($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()
                    }
                }
                
            }
            .navigationTitle("Add Expense")
            .toolbar {
                /// Cancel & Add Button
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        addExpense()
                    }
                    .disabled(isAddButtonDisabled)
                }
            }
        }
    }
    
    /// Disabling Add Button, until  all data has been entered
    var isAddButtonDisabled: Bool {
        return title.isEmpty || subTitle.isEmpty || amount == .zero
    }
    
    /// Adding Expense to the Swift Data
    func addExpense() {
        let expense = Expense(title: title, subTitle: subTitle, amount: amount, date: date, category: category)
        context.insert(expense)
        
        /// Closing the View, Once the Data has been persisted successfully
        dismiss()
    }
    
    /// Decimal Formatter
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    AddExpenseView()
}
