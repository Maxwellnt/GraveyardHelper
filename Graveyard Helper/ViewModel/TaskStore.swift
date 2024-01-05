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
    
    
    
    
    
    static var defaultTasks = [
        Todo(title: "Task 2", icon: "hola", finished: true, selectedEntry: .candle_02, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .mug_of_mead, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .black_jelly, quantity: 2),
    ]
    
    static let defaultTask =  Todo(title: "Strawberry", icon: "", finished: false, selectedEntry: .candle_02, quantity: 0, tasks: [])
    
}
