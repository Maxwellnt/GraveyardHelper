
import SwiftUI


struct ObjectRowView: View {
    let todo:Todo
    var body: some View{
        HStack {
            Text(todo.selectedEntry.rawValue)
            Text(todo.title)
        }
    }
}



struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectRowView(todo: TaskStore.defaultTask)
    }
    
}
