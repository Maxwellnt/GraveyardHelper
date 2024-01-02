import Foundation
class TaskStore:ObservableObject{
    
    @Published var tasks = loadTasks()
    
    static func loadTasks()->[Todo]{
        return TaskStore.defaultTasks
    }
    
    static let defaultTasks = [
        Todo(title: "Task 2", icon: "hola", finished: true, selectedEntry: .candle_02, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .mug_of_mead, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .black_jelly, quantity: 2),
    ]
    
    static let defaultTask =  Todo(title: "Strawberry", icon: "", finished: false, selectedEntry: .candle_02, quantity: 0)
    
}
