//
//  ObjectListView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI

struct ObjectListView: View {
    @State private var multiSelection = Set<UUID>()
    var isBuilding:Bool
    @EnvironmentObject private var taskStore:TaskStore
    @EnvironmentObject private var objectsController:ObjectsControler
    @State private var sheetIsVisible = false
    @State private var sheetAction = SheetAction.cancel
    @State private var newTask = TaskStore.defaultTask
    var body: some View {
        NavigationView {
            if isBuilding == false {
                List($objectsController.items, selection: $multiSelection) {
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
                
                
                DetailObjectView(item: objectsController.items[0])
            } else {
                List($objectsController.blueprints, selection: $multiSelection) {
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
                
                
                DetailObjectView(item: objectsController.blueprints[0])
            }
        }
        
    }
    
    private func createTask() {
        newTask.tasks = []
        
        // We mactch the selected id whit the object array
        
        
        for index in multiSelection {
            if isBuilding == true {
                if let selectedObject = objectsController.blueprints.first(where: { $0.id == index }) {
                    
                    newTask.tasks.append(Task(object: selectedObject))
                }
            } else {
                if let selectedObject = objectsController.items.first(where: { $0.id == index }) {
                    
                    newTask.tasks.append(Task(object: selectedObject))
                }
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
    ObjectListView(isBuilding: true).environmentObject(TaskStore()).environmentObject(ObjectsControler())
}
