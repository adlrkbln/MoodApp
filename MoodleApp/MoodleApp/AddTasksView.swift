//
//  AddTasksView.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import Foundation
import SwiftUI

struct AddTasksView: View {
    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var dueDate: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Name", text: $taskName)
                    TextField("Task Description", text: $taskDescription)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                
                Section {
                    Button(action: {
                        saveTask()
                    }) {
                        Text("Save Task")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Add Task")
        }
    }
    
    
    private func saveTask() {
        print("Task Saved: \(taskName), \(taskDescription), \(dueDate)")
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTasksView()
    }
}
