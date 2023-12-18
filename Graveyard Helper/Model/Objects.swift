//
//  Objects.swift
//  Graveyard Helper
//
//  Created by alumne on 18/12/2023.
//

import Foundation
import SwiftUI

struct Objects:Hashable, Identifiable{
        
        var id: some Hashable{title}
        var title:String
        var icon:String
        var finished:Bool
        var selectedEntry:EntryObjects
        var quantity:Int
    
}

enum EntryObjects:String, CaseIterable {
    
  case polishedStone = "A_polished_brick_of_stone_item"
}


