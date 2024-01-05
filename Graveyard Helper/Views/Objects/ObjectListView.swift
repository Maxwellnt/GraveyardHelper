//
//  ObjectListView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI

struct ObjectListView: View {
    var objectsList: [Objects]
    @State private var multiSelection = Set<UUID>()

    @EnvironmentObject private var taskStore:TaskStore
    @State private var sheetIsVisible = false
    @State private var sheetAction = SheetAction.cancel
    @State private var newTask = TaskStore.defaultTask
    var body: some View {
        NavigationView {
            List(objectsList, selection: $multiSelection) {
                ObjectRowView(object: $0)
                }
                .navigationTitle("Objetos")
                .toolbar{
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Create Task") {
                            createTask()
                            sheetIsVisible = true

                        }.disabled(multiSelection.isEmpty).sheet(isPresented: $sheetIsVisible, onDismiss: onSheetDismiss){
                            AddTaskView(newTask: $newTask, sheetIsVisible: $sheetIsVisible,
                                         sheetAction: $sheetAction)
                        }
                        
                    }
                }
            
            DetailObjectView(item: objectsList[0])
        }
    }
    
    private func createTask() {
        newTask.tasks = []
        
        // We mactch the selected id whit the object array
        for index in multiSelection {
            if let selectedObject = objectsList.first(where: { $0.id == index }) {
                newTask.tasks.append(Task(object: selectedObject))
            }
        }
    }
    
    func onSheetDismiss(){
        
        
        if sheetAction == SheetAction.add{
            
            let allGood = taskStore.tasks.contains{ $0.title == newTask.title}
            if !allGood {
                taskStore.addTask(newTask: newTask)
                self.newTask = TaskStore.defaultTask
                self.sheetAction = SheetAction.cancel
            } else {
                self.newTask = TaskStore.defaultTask
                self.sheetAction = SheetAction.cancel
            }
            
        }
    }
}

#Preview {
    ObjectListView(objectsList: ObjectsControler.defaultItems).environmentObject(TaskStore()).environmentObject(ObjectsControler())
}
