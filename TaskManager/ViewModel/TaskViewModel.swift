import SwiftUI

class TaskViewModel: ObservableObject {
    
    // Sample Tasks
    @Published var storedTasks: [Task] = [
        Task(taskTitle: "Meeting", taskDescription: "Discuss team", taskDate: .init(timeIntervalSince1970: 1_641_645_497 + 11577600)),
        Task(taskTitle: "Icon set", taskDescription: "Edit icons", taskDate: .init(timeIntervalSince1970: 1641649097 + 11577600)),
        Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1641652697 + 11577600)),
        Task(taskTitle: "Check asset", taskDescription: "Start checking", taskDate: .init(timeIntervalSince1970: 1641656297 + 11577600)),
        Task(taskTitle: "Team party", taskDescription: "Make fun", taskDate: .init(timeIntervalSince1970: 1641661897 + 11577600)),
        Task(taskTitle: "Client Meeting", taskDescription: "Explain Project", taskDate: .init(timeIntervalSince1970: 1641641897 + 11577600)),
        Task(taskTitle: "Next Project", taskDescription: "Discuss next project", taskDate: .init(timeIntervalSince1970: 1641677897 + 11577600)),
        Task(taskTitle: "App Proposal", taskDescription: "Meet Client", taskDate: .init(timeIntervalSince1970: 1641677897 + 11577600)),
    ]
    
    // MARK: Current Week Days
    @Published var currentWeek = [Date]()
    
    // MARK: Current Day
    @Published var currentDay = Date()
    
    // MARK: Filtering Today Tasks
    @Published var filteredTasks: [Task]?
    
    init() {
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    // MARK: Filter Today Tasks
    func filterTodayTasks() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            
            let filtered = self.storedTasks.filter { calendar.isDate($0.taskDate, inSameDayAs: self.currentDay) }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredTasks = filtered
                }
            }
        }
    }
    
    func fetchCurrentWeek() {
        let today = Date()
        var calendar = Calendar.current
        calendar.locale = Locale(identifier: "ru")
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else {
            return
        }
        
        (1...7).forEach { day in
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
    }
    
    // MARK: Extracting Date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru")
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // MARK: Checking if current date is today
    func isToday(date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: currentDay)
    }
}
