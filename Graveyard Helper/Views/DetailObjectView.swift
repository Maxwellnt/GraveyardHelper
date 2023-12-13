//
//  DetailObjectView.swift
//  Graveyard Helper
//
//  Created by alumne on 11/12/2023.
//
import SwiftUI

struct DetailObjectView: View {
    let todo:Todo
    var body: some View {
        VStack(spacing:20.0) {
            Text(todo.title)
                .multilineTextAlignment(.center)
                .font(.title3)
            GeometryReader{g in
                ZStack {
                    Circle().strokeBorder(Color.gray.opacity(0.15), lineWidth: 10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x:5, y:5)
                    Text("\(todo.selectedEntry.rawValue)")
                        .font(.system(size: g.size.height > g.size.width ? g.size.width * 0.4: g.size.height * 0.4))
                }
            }.frame(maxWidth:250)
            
        }.padding()
        
    }
}

struct DetailFruitView_Previews: PreviewProvider {
    static var previews: some View {
        DetailObjectView(todo: TaskStore.defaultTask)
        DetailObjectView(todo: TaskStore.defaultTask)
            .preferredColorScheme(.dark)
        DetailObjectView(todo: TaskStore.defaultTask)
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
