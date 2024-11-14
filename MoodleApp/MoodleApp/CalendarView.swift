import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
}

struct CalendarView: View {
    @State private var currentDate = Date()
    private let calendar = Calendar.current
    private let events: [Event] = [
        Event(title: "High Performance Computing", date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!),
        Event(title: "Applied Machine Learning", date: Calendar.current.date(byAdding: .day, value: 3, to: Date())!),
        Event(title: "Project Management", date: Calendar.current.date(byAdding: .day, value: 5, to: Date())!),
        Event(title: "Native Mobile Development", date: Calendar.current.date(byAdding: .day, value: 7, to: Date())!)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate)! }) {
                    Image(systemName: "chevron.left")
                }
                Spacer()
                Text(currentDate, formatter: DateFormatter.monthAndYear)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Button(action: { currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate)! }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            HStack {
                ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                    Text(day)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.vertical, 8)
            
            let days = generateMonthDays(for: currentDate)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 15) {
                ForEach(days, id: \.self) { date in
                    VStack {
                        Text("\(calendar.component(.day, from: date))")
                            .foregroundColor(isSameMonth(date) ? .primary : .gray)
                            .fontWeight(isToday(date) ? .bold : .regular)
                            .padding(6)
                            .background(isToday(date) ? Color.blue.opacity(0.2) : Color.clear)
                            .cornerRadius(20)
                        
                        if let event = events.first(where: { calendar.isDate($0.date, inSameDayAs: date) }) {
                            Text(event.title)
                                .font(.caption)
                                .lineLimit(1)
                                .foregroundColor(.blue)
                        }
                    }
                    .frame(height: 60)
                }
            }
            .padding(.horizontal, 8)
        }
        .padding()
        .navigationTitle("Moodline")
    }
    
    private func generateMonthDays(for date: Date) -> [Date] {
        guard let monthInterval = calendar.dateInterval(of: .month, for: date),
              let monthStartDay = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start)?.start else {
            return []
        }
        
        return (0..<42).compactMap { calendar.date(byAdding: .day, value: $0, to: monthStartDay) }
    }
    
    private func isSameMonth(_ date: Date) -> Bool {
        calendar.isDate(date, equalTo: currentDate, toGranularity: .month)
    }
    
    private func isToday(_ date: Date) -> Bool {
        calendar.isDateInToday(date)
    }
}

extension DateFormatter {
    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
