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
    let id = UUID()
    let title:String
    let icon:Image
    let recipe:[Recipe]
    let location:String
    let dlc:dlc
    var quantity:Int = 1
    


}

struct Recipe: Identifiable{
    let id:UUID = UUID()
    let table:Objects?
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
