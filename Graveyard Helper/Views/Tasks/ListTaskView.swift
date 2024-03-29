//
//  ListView.swift
//  Graveyard Helper
//
//  Created by alumne on 13/12/2023.
//
import SwiftUI
import Foundation

struct ListView: View {
    @EnvironmentObject private var taskStore:TaskStore
    @State private var sheetIsVisible = false
    @State private var sheetAction = SheetAction.cancel
    @State private var newTask = TaskStore.defaultTask
    
    var body: some View{
        NavigationView {
            List {
                ForEach(taskStore.tasks){ task in
                    let index = taskStore.tasks.firstIndex(where: {$0.id == task.id})
                    NavigationLink(destination: DetailTodoView(item:  $taskStore.tasks[index!])){
                        TodoRowView(task: task
                        )
                    }

                }.onDelete(perform: remove).onMove(perform: move)
            }.navigationBarTitle(Text("To-Do"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("+") {
                        sheetIsVisible = true
                    }
                    .sheet(isPresented: $sheetIsVisible, onDismiss: onSheetDismiss){
                        AddTaskView(newTask: $newTask, sheetIsVisible: $sheetIsVisible,
                                     sheetAction: $sheetAction)
                    }
                }
            }
        }
    }
    func remove(at offsets: IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) { taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    func onSheetDismiss(){
        
        if sheetAction == SheetAction.add{

            let allGood = taskStore.tasks.contains{ $0.title == newTask.title}
            if !allGood {
                taskStore.tasks.append(newTask)
                self.newTask = TaskStore.defaultTask
                self.sheetAction = SheetAction.cancel
                
            } else {
                self.newTask = TaskStore.defaultTask
                self.sheetAction = SheetAction.cancel
            }
            
        }
    }
    

}
enum SheetAction {
    case cancel
    case add
}



struct ListView_Preview: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(TaskStore())
    }
}
