//
//  ObjectListView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI

struct ObjectListView: View {
    @State var objectList:[Objects]
    var body: some View {
        NavigationView {
                List {
                    
                    ForEach(objectList){ object in
                        ObjectRowView(object: object
                        )
                    }
                }
                .navigationBarTitle(Text("Objetos"))
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{}
        }
    }
}

#Preview {
    ObjectListView(objectList: ObjectsControler.defaultItems)
}
