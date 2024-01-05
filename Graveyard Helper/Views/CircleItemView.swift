//
//  CircleItemView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 2/1/24.
//

import SwiftUI

struct CircleItemView: View {
    let image:Image
    var body: some View {
        VStack(spacing:20.0) {
            GeometryReader{g in
                ZStack {
                    Circle().foregroundColor(Color.white)
                    Circle()
                        .strokeBorder(Color.gray.opacity(0.5), lineWidth: 10)
                        .shadow(radius: 5, x:2, y:2)
                    
                    image.resizable().frame(width: 70, height: 70)
                    
                }
            }.frame(maxWidth:150, maxHeight: 150)
            
        }.padding()
    }
}

#Preview {
    CircleItemView(image: ObjectsControler.defaultObject.icon)
}
