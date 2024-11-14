//
//  GradeCalculatorView.swift
//  MoodleApp
//
//  Created by adel on 13.11.2024.
//

import Foundation
import SwiftUI

struct GradeCalculatorView: View {
    @State private var registerTermGrade: String = ""
    @State private var finalGradeNeeded: String = ""
    
    var body: some View {
        VStack {
            Text("Grade Calculator")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("Enter your grade for the registered term:")
                .font(.body)
                .padding(.top)
            
            TextField("Enter registered term grade", text: $registerTermGrade)
                .keyboardType(.decimalPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: calculateGrade) {
                Text("Calculate")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            if !finalGradeNeeded.isEmpty {
                Text("You need at least \(finalGradeNeeded)% on the final exam to maintain at least a 70% total grade.")
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle("Moodline")
        .padding()
    }
    
    func calculateGrade() {
        guard let registerGrade = Double(registerTermGrade) else {
            finalGradeNeeded = "Invalid input"
            return
        }
        
        let requiredTotalGrade = 70.0
        let registerTermWeight = 0.60
        let finalWeight = 0.40
        
        let registerTermScore = registerGrade * registerTermWeight
        let requiredFinalScore = (requiredTotalGrade - registerTermScore) / finalWeight
        
        finalGradeNeeded = String(format: "%.2f", requiredFinalScore)
    }
}

struct GradeCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        GradeCalculatorView()
    }
}
