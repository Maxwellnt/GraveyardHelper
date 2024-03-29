//
//  ContentView.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView{
            ListView()
                .tabItem({
            Image(systemName: "checkmark") .resizable()
            Text("To-Do List")
            })
            ObjectListView(isBuilding: true)
                .tabItem({
            Image(systemName: "house") .resizable()
            Text("Constucciones")
            })
            ObjectListView(isBuilding: false)
                .tabItem({
            Image(systemName: "hammer") .resizable()
            Text("Objetos")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(TaskStore()).environmentObject(ObjectsControler())
        ContentView().environmentObject(TaskStore()).environmentObject(ObjectsControler())
            .previewLayout(.fixed(width: 480, height: 320))
        ContentView().environmentObject(TaskStore()).environmentObject(ObjectsControler())
            .preferredColorScheme(.dark)
    }
}
