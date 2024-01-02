
import SwiftUI


struct ObjectRowView: View {
    let object:Objects
    @State private var value = 0
    let step = 1
    let range = 0...50
    var body: some View{
        
        
        HStack {
            object.icon.resizable()
                .frame(width: 50, height: 50)
          
            
           
            Stepper(value: $value, in: range, step:step ) {
                if value <= 0 {
                    Text(object.title)
                } else {
                    Text(object.title + " x" + String(value))
                }
                
            }
            Spacer()
            // Se ha quitado el boton add porque ja havia muchos elemetos en la lista
            
            
            
            
        }
    }
}



struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectRowView(object: ObjectsControler.defaultObject
        ).previewLayout(.sizeThatFits)
        ObjectRowView(object: ObjectsControler.defaultObject
        ).previewLayout(.sizeThatFits)
    }
    
}
