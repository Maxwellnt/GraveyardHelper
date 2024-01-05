
import SwiftUI


struct ObjectRowView: View {
    @EnvironmentObject private var objectsControler:ObjectsControler
    
    @State var object:Objects
    let step = 1
    let range = 1...50
    

    var body: some View{
        
        
        HStack {
            object.icon.resizable()
                .frame(width: 45, height: 45)
          
            
            Spacer()
            Stepper(
                value: $object.quantity,
                in: range,
                step: step
            )  {
                if object.quantity <= 1 {
                    
                    Text(object.title)
                } else {
                    Text(object.title + " x" + String(object.quantity))
                }
                
            }
            
            // Se ha quitado el boton add porque ja havia muchos elemetos en la lista
        }
    }
    
  

}



struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectRowView(object: ObjectsControler.defaultObject
        )
        ObjectRowView(object: ObjectsControler.defaultObject)
        .previewLayout(.sizeThatFits)
    }
    
}
