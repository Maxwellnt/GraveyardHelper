//
//  Objects.swift
//  Graveyard Helper
//
//  Created by alumne on 18/12/2023.
//

// TODO: Hacer 10 items y 10 constucciones

import Foundation
import SwiftUI


struct Objects: Identifiable{
    var id: some Hashable{title}
    let title:String
    var icon:Image
    let recipe:[Recipe]
    var location:String
    
    
}

struct Recipe: Identifiable{
    let id:UUID = UUID()
    let table:Objects?
    let materials:[Materials]
    let quantity_produced:Int
}




