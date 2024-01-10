
import SwiftUI


struct ObjectRowView: View {
    @EnvironmentObject private var objectsControler:ObjectsControler
    
    @Binding var object:Objects
    @State var value:Int = 1
    let step = 1
    let range = 1...50
    
    
    var body: some View{
        
        
        HStack {
            object.showIcon().resizable()
                .frame(width: 45, height: 45)
          
            
            Spacer()
            Stepper (
                value: $object.quantity,
                in: range,
                step: step) {
                
                
                if object.quantity <= 1 {
                    
                    Text(object.title).fixedSize(horizontal: false, vertical: true)
                } else {
                    Text(object.title + " x" + String(object.quantity))  .fixedSize(horizontal: false, vertical: true)
                }
                
            }
            
            // Se ha quitado el boton add porque ja havia muchos elemetos en la lista
        }
    }
    
    func statsChage(){
        
    }

}



struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectRowView(object: .constant(ObjectsControler.defaultItems[1])
        ).environmentObject(ObjectsControler())
        ObjectRowView(object: .constant(ObjectsControler.defaultObject))
            .previewLayout(.sizeThatFits).environmentObject(ObjectsControler())
    }
    
}
