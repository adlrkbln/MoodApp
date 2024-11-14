import SwiftUI

struct AssignmentListView: View {
    let course: Course

    var body: some View {
        List(course.assignments, id: \.id) { assignment in
            VStack(alignment: .leading) {
                Text(assignment.title)
                    .font(.headline)
                if let grade = assignment.grade {
                    Text("Grade: \(grade, specifier: "%.2f")")
                } else {
                    Text("No grade yet")
                }
                if let comment = assignment.comment {
                    Text("Comment: \(comment)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .navigationBarTitle(course.title)
    }
}

struct AssignmentListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAssignments = [
            Assignment(title: "Assignment 1", grade: 85.0, comment: "Well done!"),
            Assignment(title: "Assignment 2", grade: nil, comment: nil)
        ]
        let sampleCourse = Course(title: "Sample Course", assignments: sampleAssignments)
        return AssignmentListView(course: sampleCourse)
    }
}
