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
            ListView().environmentObject(TaskStore())
                .tabItem({
            Image(systemName: "icloud.and.arrow.down") .resizable()
            Text("Buildings")
            })
            ListView().environmentObject(TaskStore())
                .tabItem({
            Image(systemName: "icloud.and.arrow.up") .resizable()
            Text("Tasks")
            })
            ListView().environmentObject(TaskStore())
                .tabItem({
            Image(systemName: "icloud.and.arrow.down") .resizable()
            Text("Items")
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 480, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
    }
}
