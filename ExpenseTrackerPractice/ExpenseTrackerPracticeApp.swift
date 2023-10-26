//
//  ExpenseTrackerPracticeApp.swift
//  ExpenseTrackerPractice
//
//  Created by Mitch Andrade on 10/25/23.
//

import SwiftUI

@main
struct ExpenseTrackerPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        /// Setting up the container
        .modelContainer(for: [Expense.self, Category.self])
    }
}
