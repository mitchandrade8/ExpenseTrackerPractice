//
//  Category.swift
//  ExpenseTrackerPractice
//
//  Created by Mitch Andrade on 10/26/23.
//

import SwiftUI
import SwiftData

@Model
class Category {
    var categoryName: String
    /// Category Expenses
    
    @Relationship(deleteRule: .cascade, inverse: \Expense.category)
    var expenses: [Expense]?
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
