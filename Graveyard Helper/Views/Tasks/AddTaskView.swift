//
//  AddTaskView.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//
import SwiftUI

struct AddTaskView: View {
    
    @Binding var newTask:Todo
    @Binding var sheetIsVisible:Bool
    @Binding var sheetAction: SheetAction
    var allOk:Bool = true
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $newTask.title)
                }
                Section(header: Text("Image")) {
                    ImagePickerView(entry: $newTask.selectedEntry)
                        .listRowInsets(EdgeInsets())
                }
                Section(header: Text("Task")) {
                    ForEach(newTask.tasks){ task in
                        ObjectRowView(object: .constant(task.object))
                        
                    }
                }
            }.navigationTitle("Add Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        sheetIsVisible = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add"){
                        sheetIsVisible = false
                        sheetAction = .add
                    }.disabled(newTask.title.isEmpty)
                }
            }
            
        }
        
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(newTask: .constant(TaskStore.defaultTask),sheetIsVisible: .constant(false), sheetAction:.constant(SheetAction.cancel))
        AddTaskView(newTask: .constant(TaskStore.defaultTask),sheetIsVisible: .constant(false), sheetAction:.constant(SheetAction.cancel))
            .preferredColorScheme(.dark)
        AddTaskView(newTask: .constant(TaskStore.defaultTask),sheetIsVisible: .constant(false), sheetAction:.constant(SheetAction.cancel))
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
