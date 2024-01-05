//
//  TaskRowView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 2/1/24.
//

import SwiftUI

struct TodoRowView: View {
    let task:Todo
    var body: some View{
        
        
        HStack {
            task.showIcon()
                .frame(width: 32, height: 32)
                .padding(.trailing, 10)
            
            Text(task.title)
            
            
            
        }
    }
}



struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(task: TaskStore.defaultTask
        ).previewLayout(.sizeThatFits)
        TodoRowView(task: TaskStore.defaultTask
        ).previewLayout(.sizeThatFits)
    }
    
}
