//
//  Todo.swift
//  Graveyard Helper
//
//  Created by alumne on 13/12/2023.
//

import Foundation

struct Todo: Hashable, Identifiable{
    var id: some Hashable{title}
    var title:String
    var icon:String
    var finished:Bool
    var selectedEntry:Entry
    var quantity:Int
}

enum Entry:String, CaseIterable {
  case apple = "🍎"
  case banana = "🍌"
  case coco =  "🥥"
  case grape = "🍇"
  case kiwi = "🥝"
  case lemon = "🍋"
  case orange = "🍊"
  case pear = "🍐"
  case pineapple = "🍍"
  case strawberry = "🍓"
  case watermelon = "🍉"

}
