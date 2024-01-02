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
            
            CircleItemView(image: item.icon)
            
            // Item info
            VStack(alignment: .leading) {
                Text(item.title).font(.title)
                
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("Graveyard Keeper")
                }
                .font(.subheadline)
            }
            .padding()
            
            GroupBox(label: Text("Recipes")){
                    ForEach(item.recipe){ recipe in
                        
                        GroupBox(){
                            HStack(){
                                
                                Text(item.title)
                                Spacer()
                                Text(" x" + String(recipe.quantity_produced))
                            }

                                    if (recipe.table != nil){
                                        GroupBox(label:Text("Table")){
                                            HStack{
                                                recipe.table!.icon
                                                Text(recipe.table!.title)
                                                Spacer()
                                            }
                                        }
                                        
                                        
                                    }
                            GroupBox(label: Text("Materials")){
                                ForEach(recipe.materials){material in
                                    
                                    HStack{
                                        material.object.icon
                                        Text(material.object.title)
                                        
                                        Spacer()
                                        Text("x" + String(material.quantity)).font(.headline)
                                    }
                                    
                                    
                                }
                            }
 
                        }
                       
                    }
               
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

