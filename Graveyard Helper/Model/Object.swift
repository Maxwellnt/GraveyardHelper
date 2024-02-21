//
//  Objects.swift
//  Graveyard Helper
//
//  Created by alumne on 18/12/2023.
//

// TODO: Hacer 10 items y 10 constucciones

import Foundation
import SwiftUI


struct Objeto: Hashable, Codable{
    var Index:Int
    var ID:String
    var Name:String
    var base_price:Float
    var base_count: Float
    var product_types:String
    var quantity:Int
    
    
    func showIcon() -> Image {
        return Image(self.ID)
    }
    

}

struct Construccion:Codable{
    var Index:Int
    var ID:String
    
    func showIcon() -> Image {
        return Image(self.ID)
    }
    

}

struct DataModel: Codable{
    var objects: [Objeto]
    var construciones: [Construccion]
    

}


struct Recipe:Hashable, Identifiable{
    let id:UUID = UUID()
    let table:Objeto?
    let materials:[Materials]
    let quantity_produced:Int
}

enum dlc:String {
    case base = "Graveyard Keeper"
    case bss = "Better Save Soul"
    case bd = "Breaking Dead"
    case goc = "Game of Crone"
    case ss = "Stranger sins"
}
