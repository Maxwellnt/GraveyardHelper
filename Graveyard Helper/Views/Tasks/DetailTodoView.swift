//
//  DetailTodoView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI



struct DetailTodoView: View {
    @Binding var item:Todo
    
    var body: some View {
        
                VStack {
                   
                    ScrollView{
                        VStack{
                   
                        HStack{
                            item.showIcon()
                            Text(item.title).font(.title)
                            Spacer()
                        }
                        
                        if !(item.tasks.isEmpty) {
                        HStack {
                                Text("Tascas fetas \(item.quantityOfFinishedTask())/\(item.quantityOfTask())")
                           
                                       
                            Spacer()
                        }
                        .font(.subheadline)
                        
                        ProgressView(value: item.percentajeOfFinishedTask())
                        }
                            HStack{
        
                                Text("Description").font(.title2)
                                Spacer()
                              
                            }
                            
                            
                            HStack {
                               
                                    
                                Text(item.description)
                               
                                           
                                Spacer()
                            }
                            .font(.subheadline)
                        
                       
                    }
                    .padding()
                   
                    
                    }
                   
                    VStack {
                        List {
                            if !(item.tasks.isEmpty) {
                                Section(header:Text("Task ToDo").font(.headline)) {
                                    ForEach(item.tasks.indices){i in

                                            NavigationLink(destination: DetailObjectView(item: item.tasks[i].object)){
                                                TaskRowView(task: $item.tasks[i])
                                                
                                                
                                            }
                                                
                                            
                                            
                                        

                                    }
                                }
                            
                            }else{
                                Text("No Task")
                            }
                        }
                            
                        }
                    
                    Spacer()
                    
                            
                    
                    }
                
                
           
        
        
    }
}

struct DetailTodoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTodoView(item: .constant(TaskStore.defaultTask))
        DetailTodoView(item: .constant(TaskStore.defaultTask))
            .preferredColorScheme(.dark)
        DetailTodoView(item: .constant(TaskStore.defaultTask))
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
