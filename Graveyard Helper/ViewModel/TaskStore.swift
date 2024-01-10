import Foundation
class TaskStore:ObservableObject{
    
    @Published var tasks = loadTasks()
    @Published var task = defaultTask
    
    static func loadTasks()->[Todo]{
        return TaskStore.defaultTasks
    }
    
    func addTask(newTask:Todo) {
        self.tasks.append(newTask)
    }
    
    
    
    
    
    static var defaultTasks:[Todo] = []
    
    static let defaultTask =  Todo(title: "",description: "", icon: "", finished: false, selectedEntry: .candle_02, quantity: 0, tasks:[])
    
}
