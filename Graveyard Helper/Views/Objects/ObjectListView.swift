//
//  ObjectListView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI

struct ObjectListView: View {
    @State private var multiSelection: Set<Objeto> = []
    var isBuilding:Bool
    @EnvironmentObject private var taskStore:TaskStore
    @EnvironmentObject private var objectsController:ObjectsControler
    @State private var sheetIsVisible = false
    @State private var sheetAction = SheetAction.cancel
    @State private var newTask = TaskStore.defaultTask
    var body: some View {
        NavigationView {
            if isBuilding == false {
                List(objectsController.objects, id:\.ID, selection: $multiSelection) { item in
                
                    let index = objectsController.objects.firstIndex(where: {$0 == item})
                    
                    ObjectRowView(object: $objectsController.objects[index!])
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
                
                
                DetailObjectView(item: objectsController.objects[0])
            } else {
                List(objectsController.objects, id:\.ID, selection: $multiSelection) { item in
                    
                    
                    let index = objectsController.objects.firstIndex(where: {$0.ID == item.ID})
                    
                    ObjectRowView(object: $objectsController.objects[index!])
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
                
                
                DetailObjectView(item: objectsController.objects[0])
            }
        }
        
    }
    
    private func createTask() {
        newTask.tasks = []
        
        // We mactch the selected id whit the object array
        
        
        for index in multiSelection {
            if isBuilding == true {
                if let selectedObject = objectsController.objects.first(where: { $0 == index }) {
                    
                    newTask.tasks.append(Task(object: selectedObject))
                }
            } else {
                if let selectedObject = objectsController.objects.first(where: { $0 == index}) {
                    
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


struct ObjectListView_Previews: PreviewProvider {
        static var previews: some View {
    ObjectListView(isBuilding: false).environmentObject(TaskStore()).environmentObject(ObjectsControler())
    ObjectListView(isBuilding: true).environmentObject(TaskStore()).environmentObject(ObjectsControler())
}
}
