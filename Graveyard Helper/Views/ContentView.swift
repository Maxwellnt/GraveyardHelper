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
            Image(systemName: "checklist") .resizable()
            Text("To-Do List")
            })
            ObjectListView(objectsList: ObjectsControler.defaultBlueprints)
                .tabItem({
            Image(systemName: "house") .resizable()
            Text("Constucciones")
            })
            ObjectListView(objectsList: ObjectsControler.defaultItems)
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
        ContentView()
            .previewLayout(.fixed(width: 480, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
    }
}
