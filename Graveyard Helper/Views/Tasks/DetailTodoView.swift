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
            HStack{
                item.showIcon().resizable()
                    .frame(width: 42, height: 42)
                Text(item.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
            VStack {
                
                GroupBox(label: Text("Item 1")) {
                    List{
                        Text("Text")
                        Text("Text")
                        Text("Text")
                    }
                }
                
                
                GroupBox(label: Text("Item 2")) {
                    List{
                        Text("Text")
                        Text("Text")
                        Text("Text")
                    }
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
