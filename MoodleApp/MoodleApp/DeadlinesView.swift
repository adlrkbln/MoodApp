//
//  DeadlinesView.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import Foundation
import SwiftUI

struct Deadline: Identifiable {
    var id = UUID()
    var name: String
    var dueDate: Date
}

struct DeadlinesView: View {
    let deadlines = [
        Deadline(name: "Assignment 1", dueDate: Date().addingTimeInterval(86400 * 2)),
        Deadline(name: "Project Proposal", dueDate: Date().addingTimeInterval(86400 * 5)),
        Deadline(name: "Final Exam", dueDate: Date().addingTimeInterval(86400 * 10))
    ]
    
    var body: some View {
        VStack {
            Text("Upcoming Deadlines")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List(deadlines) { deadline in
                HStack {
                    VStack(alignment: .leading) {
                        Text(deadline.name)
                            .font(.headline)
                        Text("Due: \(formattedDate(deadline.dueDate))")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Text(timeRemaining(until: deadline.dueDate))
                        .font(.headline)
                        .foregroundColor(timeRemaining(until: deadline.dueDate).contains("days") ? .green : .red)
                }
                .padding(.vertical, 10)
            }
        }
        .navigationTitle("Moodline")
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    func timeRemaining(until date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let components = calendar.dateComponents([.day, .hour, .minute], from: now, to: date)
        
        if let days = components.day, let hours = components.hour, let minutes = components.minute {
            if days > 0 {
                return "\(days) days left"
            } else if hours > 0 {
                return "\(hours) hours left"
            } else {
                return "\(minutes) minutes left"
            }
        }
        return "Deadline passed"
    }
}

struct DeadlinesView_Previews: PreviewProvider {
    static var previews: some View {
        DeadlinesView()
    }
}
