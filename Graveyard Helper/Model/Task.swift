//
//  Task.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 4/1/24.
//

import Foundation

struct Task:Identifiable {
    let id:UUID = UUID()
    let object:Objects
    var finished:Bool = false
}
