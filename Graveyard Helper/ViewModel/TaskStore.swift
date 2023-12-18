import Foundation
class TaskStore:ObservableObject{
    
    @Published var tasks = loadTasks()
    
    static func loadTasks()->[Todo]{
        return TaskStore.defaultTasks
    }
    
    static let defaultTasks = [
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .strawberry, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .banana, quantity: 2),
        Todo(title: "Task", icon: "hola", finished: true, selectedEntry: .coco, quantity: 2),
    ]
    
    static let defaultTask =  Todo(title: "", icon: "", finished: false, selectedEntry: .strawberry, quantity: 0)
    
}
