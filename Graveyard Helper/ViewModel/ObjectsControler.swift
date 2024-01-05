//
//  ObjectsControler.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import Foundation
import SwiftUI



class ObjectsControler:ObservableObject{
    
    @Published var items = loadItems()
    @Published var blueprints = loadBlueprints()
    @Published var defaultItem = defaultItems
    
    static func loadItems()->[Objects]{
        return ObjectsControler.defaultItems
    }
    static func loadBlueprints()->[Objects]{
        return ObjectsControler.defaultBlueprints
    }
    
    
    static var defaultItems = [
        wooden_stick,
        log,
        simple_iron_part,
        iron_ingot,
        iron_ore,
        wood_billet,
        axe_i,
        
    ]
    
    static var defaultBlueprints = [
        furnace,
        sawhorse,
        wooden_anvil,
    ]
    
    static let defaultObject =  axe_i
    
}

var furnace: Objects = Objects(
    title: "Fragua I",
    icon: Image("Furnace_II_item"),
    recipe: [],
    location: "Patio de Trabajo",
    dlc: .base,
    quantity: 2
)

var sawhorse = Objects(
    title: "Caballete",
    icon: Image("Sawhorse_item"),
    recipe: [
        Recipe(
            table: nil,
            materials: [Materials(object: wooden_stick, quantity: 10)],
            quantity_produced: 1
        )
    ],
    location: "Patio de Trabajo",
    dlc: .base
)

var log = Objects(
    title: "Tronco",
    icon: Image("Log_item"),
    recipe: [],
    location: "Zona de Talar",
    dlc: .base,
    quantity: 2
)

var wooden_stick:Objects = Objects(
    title: "Palo de Madera",
    icon: Image("Wooden_stick_item"),
    recipe: [],
    location: "Arbustos",
    dlc: .base
)

var wood_billet = Objects(
    title: "Zoquete",
    icon: Image("Wood_billet_item"),
    recipe: [
        Recipe(
            table: sawhorse,
            materials: [Materials(object: log, quantity: 1)],
            quantity_produced: 4
        )
    ],
    location: "Patio de Trabajo",
    dlc: .base
)

var simple_iron_part = Objects(
    title: "Piezas de hierro",
    icon: Image("Simple_iron_parts_item"),
    recipe: [],
    location: "Patio de Trabajo",
    dlc: .base
)

var wooden_anvil = Objects(
    title: "Yunque de Madera",
    icon: Image("Wooden_anvil_item"),
    recipe: [
        Recipe(
            table: nil,
            materials: [
                Materials(object: wood_billet, quantity: 5),
                Materials(object: simple_iron_part, quantity: 2),
            ],
            quantity_produced: 1
        )
    ],
    location: "Patio de Trabajo",
    dlc: .base
)

var iron_ingot = Objects(
    title: "Lingote de hierro",
    icon: Image("Iron_ingot_item"),
    recipe: [
        Recipe(
            table: furnace,
            materials: [Materials(object: iron_ore, quantity: 1)],
            quantity_produced: 1
        ),
        Recipe(
            table: furnace,
            materials: [Materials(object: iron_ore, quantity: 2)],
            quantity_produced: 2
        )
    ],
    location: "Patio de Trabajo",
    dlc: .base
)


var iron_ore = Objects(
    title: "Mineral de hierro",
    icon: Image("ore_metal_item"),
    recipe: [],
    location: "Cantera",
    dlc: .base
)

var axe_i = Objects(
    title: "Hacha I",
    icon: Image("Axe_i_item"),
    recipe: [
        Recipe(
            table: wooden_anvil,
            materials: [
                Materials(object: wooden_stick, quantity: 2),
                Materials(object: simple_iron_part, quantity: 2),
                Materials(object: iron_ingot, quantity: 1),
            ], quantity_produced: 1)
    ],
    location: "Patio de Trabajo",
    dlc: .base
)


