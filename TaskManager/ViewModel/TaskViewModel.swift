import SwiftUI

class TaskViewModel: ObservableObject {
    
    // Sample Tasks
    @Published var storedTasks: [Task] = [
        Task(taskTitle: "Meeting", taskDescription: "Discuss team", taskDate: .init(timeIntervalSince1970: 1641645497)),
        Task(taskTitle: "Icon set", taskDescription: "Edit icons", taskDate: .init(timeIntervalSince1970: 1641649097)),
        Task(taskTitle: "Prototype", taskDescription: "Make and send prototype", taskDate: .init(timeIntervalSince1970: 1641652697)),
        Task(taskTitle: "Check asset", taskDescription: "Start checking", taskDate: .init(timeIntervalSince1970: 1641656297)),
        Task(taskTitle: "Team party", taskDescription: "Make fun", taskDate: .init(timeIntervalSince1970: 1641661897)),
        Task(taskTitle: "Client Meeting", taskDescription: "Explain Project", taskDate: .init(timeIntervalSince1970: 1641641897)),
        Task(taskTitle: "Next Project", taskDescription: "Discuss next project", taskDate: .init(timeIntervalSince1970: 1641677897)),
        Task(taskTitle: "App Proposal", taskDescription: "Meet Client", taskDate: .init(timeIntervalSince1970: 1641677897)),
    ]
}
