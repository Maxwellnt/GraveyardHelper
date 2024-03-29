//
//  DetailObjectView.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//
import SwiftUI

struct DetailObjectView: View {
    var item:Objeto
    var body: some View {
        VStack {
            ScrollView {
                
                ZStack {
                    Image("blueprint").resizable().mask( LinearGradient(gradient: Gradient(colors: [.white,.white,.clear]), startPoint: .top, endPoint: .bottom))
                    
                    CircleItemView(image: item.showIcon())
                }.frame(maxHeight:180)
                
                // Item info
                LazyVStack(alignment: .leading) {
                    Text(item.Name).font(.title)
                    
                    HStack {
                        Text(item.product_types)
                        Spacer()
                        Text(item.ID)
                    }
                    .font(.subheadline)
                }
                .padding()
                
                
                GroupBox(label: Text("Recipes")){
                    /*
                    if !item.recipe.isEmpty {
                        
                        ForEach(item.recipe){ recipe in
                            RecipeItenView(item: item, recipe: recipe)
                            
                        }
                        
                        
                    }else{
                        Text("No Recipes")
                    }
 */
                }
                
                Spacer()
                
                
            }
        }
    
    }
}

        
    


struct DetailFruitView_Previews: PreviewProvider {
        static var previews: some View {
            DetailObjectView(item: ObjectsControler().objects[0])
            DetailObjectView(item: ObjectsControler().objects[0])
                .preferredColorScheme(.dark)
            DetailObjectView(item: ObjectsControler().objects[0])
                .previewLayout(.fixed(width: 480, height: 320))
        }
}

