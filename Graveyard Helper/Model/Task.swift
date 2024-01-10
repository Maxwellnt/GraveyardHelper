//
//  Task.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 4/1/24.
//

import Foundation

struct Task: Hashable, Identifiable {
    let id:UUID = UUID()
    var object:Objects
    var finished:Bool = false
    

}
