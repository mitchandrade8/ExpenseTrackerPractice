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
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddExpenseView()
}
