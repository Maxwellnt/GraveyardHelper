//
//  Objects.swift
//  Graveyard Helper
//
//  Created by alumne on 18/12/2023.
//

// TODO: Hacer 10 items y 10 constucciones

import Foundation
import SwiftUI


// MARK: - Welcome
struct Items: Codable {
    let objects: [Objecto]
    let construciones: [Construccion]
}

// MARK: - Construcione
struct Construccion: Codable {
    let id: String
    let index: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case index = "Index"
    }
}

// MARK: - Object
struct Objecto: Codable {
    let index: Int
    let id, name: String
    let basePrice: Double
    let productTypes: String
    let baseCount: Int

    enum CodingKeys: String, CodingKey {
        case index = "Index"
        case id = "ID"
        case name = "Name"
        case basePrice = "base_price"
        case productTypes = "product_types"
        case baseCount = "base_count"
    }
}


struct Recipe:Hashable, Identifiable{
    let id:UUID = UUID()
    let table:Objecto?
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
