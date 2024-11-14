//
//  StudentProfileView.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import Foundation
import SwiftUI

struct Course: Identifiable {
    var id = UUID()
    var name: String
}

struct StudentProfileView: View {
    @State private var isNotificationsEnabled = true
    
    // Sample data for student's courses
    let courses = [
        Course(name: "High Performance Computing"),
        Course(name: "Applied Machine Learning"),
        Course(name: "Big Data in Law Enforcement"),
        Course(name: "Project Management"),
        Course(name: "Native Mobile Development"),
        Course(name: "Technological Entrepreneurship")
    ]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Student Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Name: Adel Yerkebulan")
                    .font(.title2)
                    .padding(.top, 5)
                Text("ID: 220782")
                    .font(.title2)
                    .padding(.top, 5)
                
                Text("Enrolled Courses:")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                
                List(courses) { course in
                    Text(course.name)
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Notifications")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Toggle(isOn: $isNotificationsEnabled) {
                    Text("Enable Notifications")
                        .font(.body)
                }
                .padding()
                
                if isNotificationsEnabled {
                    Text("You will receive notifications for deadlines, new assignments, and other updates.")
                        .font(.body)
                        .padding(.top, 5)
                } else {
                    Text("Notifications are disabled.")
                        .font(.body)
                        .padding(.top, 5)
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfileView()
    }
}
