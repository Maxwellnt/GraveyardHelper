//
//  TaskRowView.swift
//  Graveyard Helper
//
//  Created by alumne on 10/01/2024.
//

import SwiftUI

struct TaskRowView: View {
    @Binding var task:Task
    var body: some View {
        HStack {
           /*
            Button() {
                task.finished = true
            } label: {
                Label("", systemImage: task.finished ? "star.fill" : "star")
                            
            }
 */
            task.object.showIcon()
            Text(task.object.Name + " x\(task.object.base_price)")
            
            
            Spacer()
            
            
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: .constant(TaskStore.defaultTask.tasks[0]))
    }
}
