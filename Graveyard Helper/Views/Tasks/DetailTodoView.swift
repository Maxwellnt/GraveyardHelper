//
//  DetailTodoView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI



struct DetailTodoView: View {
    var item:Todo
    
    var body: some View {
        
       
            
                VStack {
                    VStack(alignment: .leading) {
                        HStack{
                            item.showIcon()
                            Text(item.title).font(.title)
                        }
                        
                        if !(item.tasks.isEmpty) {
                        HStack {
                           
                                
                                Text("Tascas fetas \(item.quantityOfFinishedTask())/\(item.quantityOfTask())")
                           
                                       
                            Spacer()
                        }
                        .font(.subheadline)
                        
                        ProgressView(value: item.percentajeOfFinishedTask())
                        }
                       
                    }
                    .padding()
                   
                        
                    
                        List {
                            if !(item.tasks.isEmpty) {
                                Section(header:Text("Task ToDo").font(.headline)) {
                                    ForEach(item.tasks){task in
                                        
                                        NavigationLink(destination: DetailObjectView(item:task.object)){
                                            
                                            HStack {
                                                task.object.icon
                                                Text(task.object.title)
                                                Text("x" + String(task.object.quantity))
                                                
                                                Spacer()
                                                
                                                
                                            }
                                        }
                                    }
                                }
                            }else{
                                Text("No Task")
                            }
                        }
                    
                        
                            
                        
                    
                }
           
        
        
    }
}

struct DetailTodoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTodoView(item: TaskStore.defaultTask)
        DetailTodoView(item: TaskStore.defaultTask)
            .preferredColorScheme(.dark)
        DetailTodoView(item: TaskStore.defaultTask)
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
