import Foundation
class TaskStore:ObservableObject{
    
    @Published var tasks = loadTasks()
    
    static func loadTasks()->[Todo]{
        return TaskStore.defaultTasks
    }
    
    static let defaultTasks = [
        Todo(title: "Pineapple", icon: "hola", finished: true, selectedEntry: .apple, quantity: 2),
        Todo(title: "Pineapple", icon: "hola", finished: true, selectedEntry: .apple, quantity: 2),
        Todo(title: "Pineapple", icon: "hola", finished: true, selectedEntry: .apple, quantity: 2),
    ]
    
    static let defaultTask =  Todo(title: "", icon: "", finished: false, selectedEntry: .apple, quantity: 0)
    
}
