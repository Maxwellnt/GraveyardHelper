//
//  DetailObjectView.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//
import SwiftUI

struct DetailObjectView: View {
    var item:Objects
    var body: some View {
        VStack {
            ScrollView {
                
                ZStack {
                    Image("blueprint").resizable().mask( LinearGradient(gradient: Gradient(colors: [.white,.white,.clear]), startPoint: .top, endPoint: .bottom))
                    
                    CircleItemView(image: item.icon)
                }.frame(maxHeight:180)
                
                // Item info
                LazyVStack(alignment: .leading) {
                    Text(item.title).font(.title)
                    
                    HStack {
                        Text("Herramienta")
                        Spacer()
                        Text(item.dlc.rawValue)
                    }
                    .font(.subheadline)
                }
                .padding()
                
                
                GroupBox(label: Text("Recipes")){
                    if !item.recipe.isEmpty {
                        
                        ForEach(item.recipe){ recipe in
                            RecipeItenView(item: item, recipe: recipe)
                            
                        }
                        
                        
                    }else{
                        Text("No Recipes")
                    }
                }
                
                Spacer()
                
                
            }
        }
    
    }
}
    
        
    


struct DetailFruitView_Previews: PreviewProvider {
        static var previews: some View {
            DetailObjectView(item: ObjectsControler.defaultObject)
            DetailObjectView(item: ObjectsControler.defaultObject)
                .preferredColorScheme(.dark)
            DetailObjectView(item: ObjectsControler.defaultObject)
                .previewLayout(.fixed(width: 480, height: 320))
        }
}

