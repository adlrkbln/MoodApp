import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: StudentProfileView()) {
                        Image("profile_icon")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(7)
                    }
                    Spacer()
                    NavigationLink(destination: GradeCalculatorView()) {
                        Image("calculator_icon")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(7)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    NavigationLink(destination: AddTasksView()) {
                        Image("add_icon")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(7)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    NavigationLink(destination: GradesView()) {
                        Image("grades_icon")
                            .resizable()
                            .frame(width: 55, height: 55)
                            .padding(7)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    NavigationLink(destination: DeadlinesView()) {
                        Image("deadline_icon")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding(7)
                            .foregroundColor(.white)
                    }
                }
                .background(Color.blue)
                .foregroundColor(.white)
                
                CalendarView()
            }
            .navigationTitle("Moodline")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
