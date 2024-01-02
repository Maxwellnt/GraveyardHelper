//
//  Materials.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import Foundation


struct Materials:Identifiable {
    let id:UUID = UUID()
    let object:Objects
    let quantity:Int
}
