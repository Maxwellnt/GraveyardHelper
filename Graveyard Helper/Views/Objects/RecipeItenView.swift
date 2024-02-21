//
//  RecipeItenView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 4/1/24.
//

import SwiftUI

struct RecipeItenView: View {
    let item:Objeto
    //let recipe:Recipe
    var body: some View {
        Text("TEXT")
        /*
         
        GroupBox(){ // Recipe Item
            
            HStack(){ // Recipe Produced
                //item.showIcon()
                Text(item.title)
                
                let qp = String(recipe.quantity_produced)
                Text(" x" +  qp)
                    .font(.headline)
                
                Spacer()
            }
            
            if (recipe.table != nil){
                
                GroupBox(label:Text("Table")){
                    HStack {
                        recipe.table!.showIcon()
                        Text(recipe.table!.title)
                        
                        Spacer()
                    }
                }
            } else {
                GroupBox(label:Text("Location")){
                    HStack {
                        
                        Text(item.location)
                        Spacer()
                    }
                }
            }
            
            GroupBox(label: Text("Materials")) {
                ForEach(recipe.materials) { material in
                    
                    HStack{
                        material.object.showIcon()
                        Text(material.object.title)
                        
                        Spacer()
                        
                        Text("x" + String(material.quantity))
                            .font(.headline)
                    }
                }
            }
            
        }
 */
    }
}

struct RecipeItenView_Previews: PreviewProvider {
        static var previews: some View {
            RecipeItenView(item: ObjectsControler().objects[0])
}
}
