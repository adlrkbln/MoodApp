//
//  GradesView.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import Foundation
import SwiftUI

struct Assignment: Identifiable {
    var id = UUID()
    var name: String
    var grade: Double
}

struct ClassGrades: Identifiable {
    var id = UUID()
    var className: String
    var assignments: [Assignment]
}

struct GradesView: View {
    let classes = [
        ClassGrades(className: "High Performance Computing", assignments: [
            Assignment(name: "Assignment 1", grade: 95),
            Assignment(name: "Midterm Exam", grade: 97),
            Assignment(name: "Assignment 2", grade: 100),
            Assignment(name: "Endterm Exam", grade: 90),
        ]),
        ClassGrades(className: "Applied Machine Learning", assignments: [
            Assignment(name: "Assignment 1", grade: 100),
            Assignment(name: "Assignment 2, 3", grade: 95),
            Assignment(name: "Midterm Exam", grade: 85),
            Assignment(name: "Assignment 4", grade: 100),
            Assignment(name: "Assignment 5", grade: 100),
            Assignment(name: "Assignment 6", grade: 100),
            Assignment(name: "Endterm Exam", grade: 93),
        ])
    ]
    
    var body: some View {
        VStack {
            Text("Grades")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            List(classes) { classGrades in
                Section(header: Text(classGrades.className).font(.title2).fontWeight(.bold)) {
                    ForEach(classGrades.assignments) { assignment in
                        HStack {
                            Text(assignment.name)
                            Spacer()
                            Text("\(Int(assignment.grade))%")
                                .foregroundColor(assignment.grade >= 70 ? .green : .red)
                        }
                    }
                }
            }
        }
        .navigationTitle("Moodline")
    }
}

struct GradesView_Previews: PreviewProvider {
    static var previews: some View {
        GradesView()
    }
}
