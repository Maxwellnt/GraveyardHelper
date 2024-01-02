//
//  Graveyard_HelperApp.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//

import SwiftUI

@main
struct Graveyard_HelperApp: App {
    @StateObject private var taskStore = TaskStore()
    @StateObject private var objectsControler = ObjectsControler()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(taskStore).environmentObject(objectsControler)
        }
    }
}
