//
//  ObjectsControler.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import Foundation
import SwiftUI



class ObjectsControler:ObservableObject{
    
    private let baseStringURL = "https://api.publicapis.org/entries"
    
    @Published var objects = [Objeto]()
    @Published var construciones = [Construccion]()

    init(){
        print("ENTERING INIT")
        if let path = Bundle.main.path(forResource: "db", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let objectsArray = try JSONDecoder().decode(DataModel.self, from: data)
                
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

