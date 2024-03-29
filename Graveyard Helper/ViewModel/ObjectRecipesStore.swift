//
//  ObjectRecipesStore.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 11/2/24.
//

import Foundation

class ObjectRecipesStore:ObservableObject{
    

    
    @Published var objectRecipes = [Objecto]()

    init(){
        print("ENTERING INIT")
        if let path = Bundle.main.path(forResource: "db", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let objectsArray = try JSONDecoder().decode(Items.self, from: data)
                
                self.objects = objectsArray.objects
                self.construciones = objectsArray.construciones

            } catch {
                print("ERROR FILE NOT LOEADER \(error)")
            }
            print("FINISH INIT")
        } else {
            print("DIDNT FIND FILE")
        }
    
    }
    
}
