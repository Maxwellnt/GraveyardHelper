//
//  Todo.swift
//  Graveyard Helper
//
//  Created by alumne on 13/12/2023.
//

import Foundation
import SwiftUI

struct Todo: Hashable, Identifiable{
    var id: some Hashable{title}
    var title:String
    var description:String
    var icon:String
    var finished:Bool
    var selectedEntry:Entry
    var quantity:Int
    var tasks:[Task] = []
    
    
    func showIcon() -> Image {
        return Image(self.selectedEntry.rawValue)
    }
    
    func quantityOfTask() -> Int {
        return tasks.count
    }
    
    func quantityOfFinishedTask() -> Int {
        return tasks.filter { task in
            task.finished == true
        }.count
    }
    
    func percentajeOfFinishedTask()->Float {
        return Float(self.quantityOfFinishedTask()/self.quantityOfTask())
    }
    
    mutating func isFinished() {
         self.finished.toggle()
    }


}

enum Entry:String, CaseIterable {
    case candle_02 = "02_candle_item"
    case mug_of_mead = "A_mug_of_mead_item"
    case black_jelly = "Black_jelly_item"
}

